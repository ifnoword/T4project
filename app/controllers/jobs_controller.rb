class JobsController < ApplicationController

  def index

  end
  
  def new
  end
  
  def create
	 @job = Job.create!(params[:job])
flash[:notice] = "#{@job[:title]} was successfully created."
    redirect_to '/users/show'
  end

  def preview
    @job_details = params[:job]
  end
end
