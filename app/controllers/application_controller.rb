class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    if session[:username].blank?
      redirect_to root_path
    end
  end

end
