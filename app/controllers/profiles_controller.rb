class ProfilesController < ApplicationController
  before_filter :sign_in, only: [:edit,:update]
  before_filter :correct_user, only:[:edit, :update]
  def correct_user
    owner= Profile.find(params[:id]).user
    if @current_user.id!=owner.id
      flash[:warning]="You can't access that page!"
      redirect_to jobs_path
    end
  end

  def new
  end
  def show
    id = params[:id]
    @profile = Profile.find(id)
  end
  def edit
    @profile=@current_user.profile
  end
  
  def update
    @profile=@current_user.profile
    @profile=Profile.update_profile(params[:profile],@profile)
    if @profile.errors.messages.size==0
      flash[:notice] = "Your profile was successfully updated."
      redirect_to profile_path(@profile)
    else
      flash.now[:updt_profile_fail]=@profile

      render :action=>:edit, :id=>@profile
    end
  end 
end
