class SessionsController < ApplicationController
  def new
  end

  def create
    pwd = params[:session]['password'].gsub("\"","")
    @user = User.login(params[:session]['email'], pwd)
    if !@user
      flash[:login_fail]="Wrong Email or Password!"
      redirect_to login_path
    else
      session[:current_user]=@user.email
      redirect_to jobs_path
    end
  end
 
  def destroy
    session.delete(:current_user)
    redirect_to jobs_path
  end
 

end
