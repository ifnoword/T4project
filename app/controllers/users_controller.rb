class UsersController < ApplicationController
  before_filter :sign_in, except: [:new, :create]
  before_filter :correct_user, except:[:new, :create]
  def sign_in
    flash[:warning]='Please log in!'
    redirect_to login_path unless !!@current_user
  end

  def correct_user
    flash[:warning]='No Authenrization!'
    owner= User.find params[:id]
    redirect_to jobs_path unless @current_user.id==owner.id
  end

  def index
  end
  
  def new 
  end 

  def show 
  end

  def edit
 
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
  
  def myjobs
    @user=@current_user
  end

end
