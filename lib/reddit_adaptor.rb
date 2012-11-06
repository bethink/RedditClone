class RedditAdaptor
  def self.top(options={})
    response = HTTParty.get('http://www.reddit.com/top.json')

    response['data']['children'].collect do |children|
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