class Reddit

  PAGE = 1
  def self.top(options={})
    options[:page] ||= PAGE
    RedditAdaptor.top(options)
  end

# Reddit.top(:page => 1, :per_page => 15)

end