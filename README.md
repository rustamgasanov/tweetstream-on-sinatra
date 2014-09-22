To start the app:

    rackup config.ru -p 3100

It is also compatible with Heroku. To configure it, you should specify `consumer_key`, `consumer_secret`, `oauth_secret` and `oauth_token` in Dashboard -> Settings -> Config Variables. And change default Dashboard -> Resources, set Web dynos to 0 and Worker dynos to 1. Or use

    heroku ps:scale web=0 worker=1
