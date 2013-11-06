class UsersController < ApplicationController
  def new 
  end #new

  def create
    puts params[:user].inspect
    @user = User.create_user!(params[:user])
	
    if @user.class == User  
      flash[:notice] = "#{@user.email} was successfully created."     
      redirect_to jobs_path     
    else 
      flash[:acct_fail] = @user
      redirect_to new_user_path
    end
  end #create

end
