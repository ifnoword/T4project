class ApplicationController < ActionController::Base
  protect_from_forgery

before_filter :set_current_user

  def set_current_user
    @current_user||=session[:current_user]&&User.find_by_email(session[:current_user])
  end
end
