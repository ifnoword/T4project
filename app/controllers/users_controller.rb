class UsersController < ApplicationController

  def new 
  end #new

  def create
    puts params[:user].inspect
    @user = User.create_user!(params[:user])
	
    if !!@user       
      flash[:notice] = "#{@user.email} was successfully created."
      redirect_to jobs_path
    else
	flash[:notice] = "Try again."
      redirect_to new_user_path
    end
  end #create

end
