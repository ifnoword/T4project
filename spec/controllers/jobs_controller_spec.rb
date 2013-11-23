require 'spec_helper'

describe JobsController do
  before(:each) do
    controller.class.skip_before_filter :sign_in
    controller.class.skip_before_filter :correct_owner
  end
  describe'adding a job' do
    it 'should add the job to the table' do
      fake_job = double('job1')
      fake_error = double('error1')
      fake_msg = double('msg1')
      fake_job.should_receive(:errors).and_return(fake_error)
      fake_error.should_receive(:messages).and_return(fake_msg)
      fake_msg.should_receive(:size).and_return(0)
      Job.stub(:create_job).and_return(fake_job)
      post :create, {:job => "this_job"}
      #response.should redirect_to(jobs_path(fake_job))
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
      #response.should redirect_to(jobs_path(fake_job))
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
      fake_job = double('job1')
      fake_user = double('user1')
      fake_job.should_receive(:title)
      fake_job.should_receive(:destroy)
      Job.should_receive(:find).with("job_id").and_return(fake_job)
      controller.instance_variable_set(:@current_user, fake_user)
      delete :destroy, {:id => "job_id"}
      response.should redirect_to(myjobs_path(fake_user))
    end
  end
  describe 'preview job' do
    it 'should take you to the preview page' do
      post :preview
      response.should render_template('preview')
    end
  end

  describe 'search' do
    it 'should use find method to search job database' do
      Job.should_receive(:find).exactly(3).times.and_return("this")
      post :dosearch, {:search => {:title => "that"}}
      response.should render_template('dosearch')
    end
  end
end
