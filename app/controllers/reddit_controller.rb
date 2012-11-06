class RedditController < ApplicationController

  # before_filter :authenticate 
  
  def top
    @post = Reddit.top
  end
  
end
