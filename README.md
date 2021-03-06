# Ruby on Rails OpenID Connect with Ultra Auth Sample

- This is a sample Rails 5.1 app that uses OpenID Connect with the Ultra Auth identity server.
- This app also serves as a basic blueprint for interaction with your apps for development.  

## Create a Ultra Auth Application

1. Sign up [`Ultra Auth `](https://www.ultraauth.com/user/sign_up)
2. Log into Ultra Auth Dashboard
3. Create a new application from the Create Applications tab

With your application provisioned, you will have the necessary `OPENID_CLIENT_ID` and `OPENID_CLIENT_SECRET` to launch the sample application. Here is an example setup for your Heroku ENV:

```sh
OPENID_CLIENT_ID: 0d2ee26a-e0d6-4b91-aded-1ef0618f62c2 
OPENID_CLIENT_SECRET: dvEJSuG3Y8DYS/hcaxEKigYK25WeYCOgxCJLDH3EpH/vUI1X1hzSErDlNfLID9aP  
OPENID_PROVIDER_URL: https://srv.qryp.to
OPENID_ISSUER: https://srv.qryp.to/op
OPENID_ISSUER: 443
```

## Deploy Sample Application

Heroku is the fastest way to get the sample app running.

### Single Click Heroku Deployment

1. Deploy by clicking button below:<br/><br/>[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/UltraAuth/rails_openidconnect_starter_app)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fultraauth%2Frails_openidconnect_starter_app.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fultraauth%2Frails_openidconnect_starter_app?ref=badge_shield)

2. Update `OPENID_CLIENT_ID` and `OPENID_CLIENT_SECRET` environment vars with you with those you provisioned in the Ultra Auth dashboard.

### Manual Heroku Deployment

To experiment with making edits to the sample application:

1. Clone sample application locally

```sh
git clone https://github.com/UltraAuth/rails_openidconnect_starter_app 
cd rails_openidconnect_starter_app
bundle install
```

2. Create Heroku Application:

```sh
heroku create --app deauthorized-rails-sample
git config --list | grep heroku
git push heroku master
``` 

3. Make your code updates in [`app/controllers/openid_controller.rb`](https://github.com/UltraAuth/rails_openidconnect_starter_app/blob/master/app/controllers/openid_controller.rb)

```sh
git add app/controllers/openid_controller.rb
git commit -m 'small update to sample app'
git push heroku master
heroku run rake db:migrate (if database migration needed)
heroku open
```

## Documentation

For more information on using Ultra Auth's biometric authentication solutions, [visit our website](https://www.ultraauth.com)


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fultraauth%2Frails_openidconnect_starter_app.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fultraauth%2Frails_openidconnect_starter_app?ref=badge_large)