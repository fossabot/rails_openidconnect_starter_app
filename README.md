# Django OpenID Connect with Deauthorized Example

- This is a sample Rails 5.1 app that uses OpenID Connect with the Deauthorized server.
- This app also serves as a basic blueprint for intergation with your apps for development.  

## Create a Deauthorized Application

1. Sign up to the Deauthorized Beta
2. Log into [Deauthorized Dashboard](https://www.deauthorized.com/users/sign_in)
3. Create a new application from [Applications](https://www.deauthorized.com/apps/new) tab

With your application provisioned, you will have the necessary `OPENID_CLIENT_ID` and `OPENID_CLIENT_SECRET` to launch the sample application.

```
OpenID Client ID: 0d2ee26a-e0d6-4b91-aded-1ef0618f62c2 ## This is the OPENID_CLIENT_ID
OpenID Client Secret: dvEJSuG3Y8DYS/hcaxEKigYK25WeYCOgxCJLDH3EpH/vUI1X1hzSErDlNfLID9aP  ## This is the OPENID_CLIENT_SECRET
OpenID Host: srv.qryp.to
OpenID Port: 443
OpenID Issuer: https://srv.qryp.to/op
```

# Deploy Sample Application

Heroku is the fastest way to get the sample app running.

## Single Click Heroku Deployment

1. Deploy by clicking button below:<br/><br/>[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

2. Update `OPENID_CLIENT_ID` and `OPENID_CLIENT_SECRET` environment vars with you with those you provisioned in the Deauthorized dashboard.

## Manual Heroku Deployment
To experiment with making edits to the sample application:

1. Clone sample application locally

```sh
$ git clone https://github.com/Deauthorized/rails_openidconnect_starter_app
cd rails_openidconnect_starter_app
```

2. Create Heroku Application:
```sh
$ heroku create --app deauthorized-rails-sample
Creating ⬢ deauthorized-rails-sample... done
https://deauthorized-rails-sample.herokuapp.com/ | https://git.heroku.com/deauthorized-rails-sample.git
```

3. Make your code updates in [`app/controllers/openid_controller.rb`](https://github.com/Deauthorized/rails_openidconnect_starter_app/blob/master/app/controllers/openid_controller.rb)


```sh
$ git add app/controllers/openid_controller.rb
$ git commit -m 'small update to sample app'
$ git push heroku master
$ heroku run rake db:migrate (if database migration needed)
$ heroku open
```

## Documentation

For more information on using Deauthorized's biometric authentication solutions, [visit our website](https://www.deauthorized.com)
