class JobsController < ApplicationController

  def index
  end
  
  def new
  end
  
  def create
    @job = Job.create_job(params[:job], @current_user)

    if @job.errors.messages.size == 0
      flash[:notice] = "Your new job was successfully created."
      redirect_to job_path(@job)
    else
      flash.now[:new_job_fail] = @job
      render(:action=>:new)
    end
  end
  
  def show
   id = params[:id]
   @job = Job.find(id)
  end 
  
  def edit
    @job = Job.find params[:id]
  end
  
  def update
    @job = Job.find params[:id]
    @job = Job.update_attrbs(params[:job], @job)
    if @job.errors.messages.size == 0
      flash[:notice] = "The job was successfully updated."
      redirect_to job_path(@job)
    else
      flash.now[:updt_job_fail] = @job
      render :action=>:edit, :id=>@job
    end
  end

  def destroy
    @job = Job.find(params[:id])

    flash[:notice] = "Job #{@job.title} is deleted."
    redirect_to user_path(@current_user)
  end
  def preview
    @job_details = params[:job]
  end
end
