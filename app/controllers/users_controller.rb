class UsersController < ApplicationController

  def new 
  end #new

  def create
    puts params[:user].inspect
    @user = User.create_user!(params[:user])
	
    if !!@user       
      flash[:notice] = "Please enter correct information."
      redirect_to new_user_path     
    else
      flash[:notice] = "#{@user.email} was successfully created."
      redirect_to jobs_path
    end
  end #create

end
