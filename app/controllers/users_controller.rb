class UsersController < ApplicationController
 
  def index

  end
  def new 
  end 

  def show 
  end

  def edit
 
  end

  def update
    @current_user[:tel] = params[:user][:phone]
    @current_user.save!
    flash[:notice] = "Phone number was successfully updated."     
    redirect_to '/users/show'

  end

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
