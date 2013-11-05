class SessionsController < ApplicationController

    def new
  end

  def create
    @user = User.login(params[:session]['email'], params[:session]['password'])
    if !@user
      flash[:warning]="Wrong Email or Password!"
      redirect_to login_path
    else
      session[:current_user]=@user.email
      redirect_to jobs_path
    end
  end
 
  def destroy
    session.delete(:current_user)
    redirect_to :back
  end
 

end
