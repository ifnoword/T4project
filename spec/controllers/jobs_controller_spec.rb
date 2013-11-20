require 'spec_helper'

describe JobsController do
  describe'adding a job' do
    it 'should add the job to the table' do
      fake_job = double('job1')
      fake_error = double('error1')
      fake_msg = double('msg1')
      fake_job.should_receive(:errors).and_return(fake_error)
      fake_error.should_receive(:messages).and_return(fake_msg)
      fake_msg.should_receive(:size).and_return(0)
      Job.should_receive(:create_job).and_return(fake_job)
      post :create, {:job => "this_job"}
      response.should redirect_to(job_path(fake_job))
    end
    it 'should show the newly added job' do
      Job.should_receive(:find).with("job_id").and_return("confirm")
      post :show, {:id => "job_id"}
      assigns(:job).should == "confirm"
      response.should render_template('show')
    end
    it 'should go back to new page and display error if bad input' do
      fake_job = double('job1')
      fake_error = double('error1')
      fake_msg = double('msg1')
      fake_job.should_receive(:errors).and_return(fake_error)
      fake_error.should_receive(:messages).and_return(fake_msg)
      fake_msg.should_receive(:size).and_return(1)
      Job.should_receive(:create_job).and_return(fake_job)
      post :create, {:job => "this_job"}
      response.should render_template('new')
    end
  end

  describe 'edit job' do
    it 'should generate edit page' do
      Job.should_receive(:find).with("job_id").and_return("confirm")
      post :edit, {:id => "job_id"}
      assigns(:job).should == "confirm"
      response.should render_template('edit')
    end
    it 'should update job listing' do
      fake_job = double('job1')
      fake_error = double('error1')
      fake_msg = double('msg1')
      fake_job.should_receive(:errors).and_return(fake_error)
      fake_error.should_receive(:messages).and_return(fake_msg)
      fake_msg.should_receive(:size).and_return(0)
      Job.should_receive(:find).with("job_id").and_return("confirm")
      Job.should_receive(:update_attrbs).with("this_job", "confirm").and_return(fake_job)
      post :update, {:id => "job_id", :job => "this_job"}
      response.should redirect_to(job_path(fake_job))
    end
    it 'should return to edit page if error' do
      fake_job = double('job1')
      fake_error = double('error1')
      fake_msg = double('msg1')
      fake_job.should_receive(:errors).and_return(fake_error)
      fake_error.should_receive(:messages).and_return(fake_msg)
      fake_msg.should_receive(:size).and_return(1)
      Job.should_receive(:find).with("job_id").and_return("confirm")
      Job.should_receive(:update_attrbs).with("this_job", "confirm").and_return(fake_job)
      post :update, {:id => "job_id", :job => "this_job"}
      response.should render_template('edit')
    end
  end

  describe 'delete job' do
    it 'should delete job from database' do
      pending("need to someone test with respect to a certain session") #pending
      @current_user = User.create_user!(:email => "test@test.com", :password => "password", :password_confirmation => "password")
      fake_job = double('job1')
      fake_user = double('user1')
      fake_job.should_receive(:title)
      Job.should_receive(:find).with("job_id").and_return(fake_job)
      delete :destroy, {:id => "job_id"}
      response.should redirect_to(user_path(@current_user))
    end
  end
end
