class ProfilesController < ApplicationController
  def new
  end
  def show
    @profile=@current_user.profile
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
      puts flash.now[:updt_profile_fail]
      render :action=>:edit, :id=>@profile
    end
  end 
end
