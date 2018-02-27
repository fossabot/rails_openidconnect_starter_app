Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/auth', to: 'openid#auth', as: 'openid_auth'
  get '/openid_auth_callback', to: 'openid#auth_callback', as: 'openid_auth_callback'
end
