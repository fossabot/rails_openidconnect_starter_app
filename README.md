# rails-5.1-openid-sample
This is a sample Rails 5.1 app that uses OpenID Connect with the Deauthorized server. 

## env variables
```sh
"OPENID_CLIENT_ID"="Client ID registered on OpenID provider" # i.e., deauthorized
"OPENID_CLIENT_SECRET"="Client secret provided from OpenID provider" # 123
"OPENID_HOST"="OpenID provider hostname" # srv0.qryp.to"
"OPENID_PORT"="OpenID provider port number" # 443
"OPENID_ISSUER"="OpenID issuer URL" # https://srv0.qryp.to:8002/op
```

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)