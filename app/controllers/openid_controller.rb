class OpenidController < ApplicationController

  def auth
  	# Redirect to provider's authentication page
  	redirect_to client.authorization_uri(
      response_type: :code,
      state: new_nonce,
      nonce: new_nonce,
      scope: [:openid, :email, :profile, :address].collect(&:to_s)
    )
  end

  # callback methods after OpenID authentcation
  def auth_callback
  	@response = params
  	client.redirect_uri = openid_auth_callback_url
    client.authorization_code = params['code']

    @access_token = client.access_token! client_auth_method: client_auth_method
    @userinfo = @access_token.userinfo!

    @id_token = decode_id @access_token.id_token
    @id_token.verify!(
      issuer: ENV['OPENID_ISSUER'],
      client_id: ENV['OPENID_CLIENT_ID'],
      nonce: stored_nonce
    )
    @openid_subject = @id_token.subject
  end

  protected

  def options
    {
      identifier: ENV['OPENID_CLIENT_ID'],
      secret: ENV['OPENID_CLIENT_SECRET'],
      scopes_supported: [:openid, :email, :profile, :address],
      host: ENV['OPENID_PROVIDER_URL'],
      port: ENV['OPENID_PORT'] || 443,
      scheme: 'https',
      jwks_uri:openid_config.jwks_uri,
      authorization_endpoint: openid_config.authorization_endpoint,
      token_endpoint: openid_config.token_endpoint,
      userinfo_endpoint: openid_config.userinfo_endpoint,
      redirect_uri: openid_auth_callback_url
    }
  end

  def openid_config
    @openid_config ||= OpenIDConnect::Discovery::Provider::Config.discover! ENV['OPENID_ISSUER']
  end

  def client
    @client ||= OpenIDConnect::Client.new options
  end

  def client_auth_method
    supported = openid_config.token_endpoint_auth_methods_supported
    if supported.present? && !supported.include?('client_secret_post')
      :post
    else
      :basic
    end
  end

  def decode_id(id_token)
    OpenIDConnect::ResponseObject::IdToken.decode id_token, openid_config.jwks
  end

  def to_access_token(access_token)
    OpenIDConnect::AccessToken.new(
      access_token: access_token,
      client: client
    )
  end
end
