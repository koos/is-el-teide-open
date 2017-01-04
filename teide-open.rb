require 'sinatra'
require 'twitter'
require 'byebug'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require './models/tweet'

def twitter
	client = Twitter::REST::Client.new do |config|
  	config.consumer_key        = "tCk7XBOTRF4QcCKsRNE7YN1Dw"
  	config.consumer_secret     = "KcIeW9fI07xfkYUUSaaFBUPiy8gg9PPjO2Fqt5GCtpmSO78B01"
 	 	config.access_token        = "1321591-yw8rVXTZGf9kn60jAqKZsVkGdriSMxjN6iTaQ1GgRQ"
  	config.access_token_secret = "GRXvrFX6ps9AnOlvQUn4GSoGdnkMccHBzyiKg6b3ssqzV"
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