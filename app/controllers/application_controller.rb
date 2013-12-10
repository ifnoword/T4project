class ApplicationController < ActionController::Base
  protect_from_forgery

  prepend_before_filter :set_current_user

  def set_current_user
    @current_user||=session[:current_user]&&User.find_by_email(session[:current_user])
  end

  def sign_in
    if !@current_user
      flash[:warning]='Please log in!'
      redirect_to login_path
    end
  end

end
