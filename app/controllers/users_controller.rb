class UsersController < ApplicationController

  def new 
  end #new

  def create
    puts params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "#{@user.email} was successfully created."
      redirect_to jobs_path
    else
      render 'new'
    end
  end #create

end
