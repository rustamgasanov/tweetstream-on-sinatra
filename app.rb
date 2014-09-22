require 'sinatra'
require 'em-twitter'
require 'json'
require 'yaml'
require './twitter_streamer'

begin
  twitter_keys = YAML.load_file('config.yml')
rescue
  twitter_keys = { 'consumer_key' => ENV['consumer_key'], 'consumer_secret' => ENV['consumer_secret'],
    'oauth_token' => ENV['oauth_token'], 'oauth_secret' => ENV['oauth_secret'] }
end
params = { :track => 'coffee' }
# params = { :follow => '254540449' }

twitter_streamer = TwitterStreamer.new(twitter_keys, params)
twitter_streamer.run

