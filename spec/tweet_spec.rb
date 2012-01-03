require "minitest/autorun"
require_relative "../lib/tweet"

describe Tweet do

  describe "#author" do

    it "returns the author of the tweet" do
      tweet = Tweet.new "alberta: @duncan, hope you're bringing those peanut butter chocolate cookies again :D"
      tweet.author.must_equal "alberta"
    end

  end

  describe "#mentioned_names" do

    it "returns an empty array if there is no mentioned users" do
      tweet = Tweet.new "darrel_skiles: Each new step we take in thought reconciles twenty seemingly  discordant facts, as expressions of one law"
      tweet.mentioned_names.must_be_empty 
    end

    it "returns an array of the mentioned users" do
      tweet = Tweet.new "christie: \"Every day, men and women, conversing, beholding and beholden...\" /cc @alberta, @bob"
      tweet.mentioned_names.must_equal %w{alberta bob}
    end

  end

end
