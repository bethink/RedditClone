class RedditController < ApplicationController

  before_filter :authenticate
  def top
    @posts = Reddit.top(:page => params[:page], :after => params[:after])
  end

end
