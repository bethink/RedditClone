class RedditAdaptor

  PERPAGE = 15
  def self.get_uri(options={})
    options[:page] = options[:page].to_i
    if options[:page] == 1 || options[:page].blank?
      "?limit=#{PERPAGE}"
    elsif options[:page] == 2
      "?limit=#{PERPAGE}&after=#{options[:after]}"
    elsif options[:page] == 3
      "?limit=#{PERPAGE*3}"
    end
  end

  def self.top(options={})

    uri = get_uri(options)

    response = HTTParty.get('http://www.reddit.com/top.json' + uri)

    posts = if options[:page] == 3
      response['data']['children'].last(PERPAGE)
    else
      response['data']['children']
    end

    posts.collect do |children|
      OpenStruct.new children['data']
    end
  end

  def self.authenticate(username, password)
    HTTParty.post('http://www.reddit.com/api/login.json', { :body => { :user => username, :passwd => password } })
  end

  def self.authenticated?(username, password)
    response = RedditAdaptor.authenticate(username, password)
    !response.headers['set-cookie'][/reddit_session/].blank?
  end

end