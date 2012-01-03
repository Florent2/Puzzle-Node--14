#!/usr/bin/env ruby

require_relative "./lib/tweet"
require_relative "./lib/user"

abort "Usage: ./discover_social_network.rb input_file_name" unless ARGV.size == 1

tweets = IO.readlines ARGV[0]
users  = SortedSet.new

tweets.each do |tweet_string|
  tweet  = Tweet.new tweet_string
  author = users.find { |user| user.name == tweet.author } || User.new(tweet.author)

  users << author
  author.add_mentioned_names tweet.mentioned_names
end

users.each do |user|
  order = 0

  begin
    connections = user.connections users, order 
    puts connections.map(&:name).join(", ")
    order = order + 1
  end until connections.empty?
end
