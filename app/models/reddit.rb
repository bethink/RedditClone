class Reddit

  PAGE = 1
  PERPAGE = 15

  def self.top(options={})
    options[:page] ||= PAGE
    options[:per_page] = PERPAGE

    RedditAdaptor.top(options)
  end

# Reddit.top(:page => 1, :per_page => 15)

end