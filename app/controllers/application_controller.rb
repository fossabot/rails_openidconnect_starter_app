class ApplicationController < ActionController::Base
	include Nonce
	
  protect_from_forgery prepend: true

  rescue_from(
    Rack::OAuth2::Client::Error,
    OpenIDConnect::Exception,
    Nonce::Exception,
    MultiJson::LoadError,
    OpenSSL::SSL::SSLError
  ) do |e|
    puts e.message
    redirect_to root_url
  end
end
