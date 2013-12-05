class JobsController < ApplicationController
 # before_filter :sign_in, except: [:index, :dosearch]
 # before_filter :correct_owner, except: [:index, :new, :create, :dosearch]

  def sign_in
    if !@current_user
    flash[:warning]='Please log in!'
    redirect_to login_path 
    end
  end

  def correct_owner
    owner= Job.find(params[:id]).user
    if @current_user.id!=owner.id
      flash[:warning]="You can't access that page!"
      redirect_to jobs_path
    end
  end

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
    flash[:notice] = "Job #{@job.title} was deleted."
    @job.destroy
    redirect_to myjobs_path(@current_user)
  end
  def preview
    @job_details = params[:job]
  end

  def dosearch
    dropdown = params[:search][:dropdown]
    search = params[:search][:title]
 
  case dropdown

  when "Title"
  	@jobs = Job.where(["title like ?", "%#{search}%"]).page(params[:page]).per(5)

  when "Company"  
	@jobs = Job.where(["companyname like ?", "%#{search}%"]).page(params[:page]).per(5)

  when "Location"
	@jobs = Job.where(["city like ?", "%#{search}%"]).page(params[:page]).per(5)
  else	
 
        @jobs = Job.where(["title like ? or companyname like ? or city like ?", "%#{search}%" , "%#{search}%", "%#{search}%"]).page(params[:page]).per(5)    
  end 

   if(@jobs.size == 0)
      flash[:notice] = "No jobs match the search terms."
      redirect_to jobs_path
    end

  end
end
