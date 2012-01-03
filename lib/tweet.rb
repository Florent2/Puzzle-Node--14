class Tweet
  USERNAME_CHARS = "a-z0-9_"

  attr_reader :author, :content

  def initialize(string)
    string   =~ /([#{USERNAME_CHARS}]+):(.+)/
    @author  = $1
    @content = $2
  end

  def mentioned_names
    scan_results = @content.scan /\s@([#{USERNAME_CHARS}]+)/i
    scan_results.map { |r| r.first }
  end

end
