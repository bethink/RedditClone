class UsersController < ApplicationController
  def index
    unless session[:username].blank?
      redirect_to top_reddit_index_path
    end
  end

  def login
    auth_status = RedditAdaptor.authenticated?(params[:username], params[:password])

    if auth_status
      session[:username] = params[:username]
      redirect_to top_reddit_index_path
    else
      redirect_to root_url, :error => "Invalid usename / password."
    end
  end

  def logout
    session[:username] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end