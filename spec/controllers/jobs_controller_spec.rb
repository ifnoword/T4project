require 'spec_helper'

describe JobsController do
  describe'adding a job' do
    it 'should add the job to the table and return to the users profile page' do
      fake_job = double('job1')
      fake_job.should_receive(:title).and_return("this_job")
      Job.should_receive(:create!).with("this_job").and_return(fake_job)
      post :create, {:movie => "this_job"}
      response.should redirect_to(user_path)
    end
  end
end
