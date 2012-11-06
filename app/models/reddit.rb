class Reddit

  def self.top(options={})
    options[:page] ||= 1
    RedditAdaptor.top(options)
  end

end