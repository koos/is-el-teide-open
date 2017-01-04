require 'sinatra'
require 'twitter'
require 'byebug'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/tweet'
require "sinatra/config_file"

config_file './config/twitter.yml'
config_file './config/analytics.yml'

def twitter
	client = Twitter::REST::Client.new do |config|
  	config.consumer_key        = settings.consumer_key
  	config.consumer_secret     = settings.consumer_secret
 	 	config.access_token        = settings.access_token
  	config.access_token_secret = settings.access_token_secret
  end
end

get '/' do

  if Tweet.all == []
    twitter.search("from:VolcanoTeide closed OR closes", result_type: "recent").take(1).each do |tweet|
      Tweet.create(origin_id: tweet.id, text: tweet.text, published_at: tweet.created_at) if tweet
    end
  end

  twitter.search("from:VolcanoTeide closed OR closes", result_type: "recent").take(1).each do |tweet|
    if !Tweet.pluck(:origin_id).include?(tweet.id)
      Tweet.create(origin_id: tweet.id, text: tweet.text, published_at: tweet.created_at)
    end
  end

  @last_tweet = Tweet.last

  haml :index, locals: {last_tweet: @last_tweet}
end