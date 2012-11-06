class UsersController < ApplicationController

  # before_filter :authenticate, :only => [:index]

  def index
  end

  def login
    auth_status = RedditAdaptor.authenticated?(params[:username], params[:password])

    if auth_status
      session[:username] = params[:username]
      redirect_to top_reddit_index_path, :notice => "Logged in successfully."
    else
      redirect_to root_url, :error => "Invalid usename / password."
    end
  end

  def logout
    session[:username] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end