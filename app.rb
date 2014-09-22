require 'sinatra'
require 'em-twitter'
require 'json'
require 'yaml'
require './twitter_streamer'

twitter_keys = YAML.load_file('config.yml')
params = { :track => 'coffee' }
# params = { :follow => '254540449' }

twitter_streamer = TwitterStreamer.new(twitter_keys, params)
twitter_streamer.run

