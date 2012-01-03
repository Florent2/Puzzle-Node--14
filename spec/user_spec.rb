require "minitest/autorun"
require_relative "../lib/user"

describe User do

  describe "#add_mentioned_names" do
   
    before do
      @user = User.new
    end

    it "stores the names in mentioned_names" do
      @user.add_mentioned_names ["joe", "jack"]
      @user.mentioned_names.must_equal Set.new(["joe", "jack"])
    end

    it "does not add an already stored name" do
      @user.add_mentioned_names ["joe", "jack"]
      @user.add_mentioned_names ["joe", "jill"]
      @user.mentioned_names.must_equal Set.new(["joe", "jack", "jill"])
    end

  end

end
