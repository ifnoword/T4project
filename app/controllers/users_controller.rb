class UsersController < ApplicationController
  before_filter :sign_in, except: [:new, :create]
  before_filter :correct_user, except:[:new, :create]
  def sign_in
    if !@current_user
      flash[:warning]='Please log in!'
      redirect_to login_path
    end
  end

  def correct_user
    owner= User.find params[:id]
    if @current_user.id!=owner.id
      flash[:warning]='No Authenrization!'
      redirect_to jobs_path
    end
  end

  def index
  end
  
  def new 
  end 

  def show 
  end

  def edit
    @user = @current_user
  end

  def update
    user= User.find params[:id]
    user= User.update_attrbs(params[:user], user)
    if user.class == User
      flash[:notice] = "Your account was successfully updated."
      redirect_to edit_user_path(user)
    else
      flash.now[:updt_acct_fail] = user
      render :action=>:edit, :id=> @current_user
    end

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
  
  def destroy
    # DON'T touch the function now!!!!!!!
  end

end
