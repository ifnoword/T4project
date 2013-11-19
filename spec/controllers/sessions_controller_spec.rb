require 'spec_helper'

describe SessionsController do
  describe 'login' do
    it 'should check validity and redirect to home page if valid' do
      fake_user = double('user2')
      fake_user.stub(:email).and_return("this_user")
      User.should_receive(:login).with("user","password").and_return(fake_user)
      post :create, {:session => {'email' => "user", 'password' => "password"}}
      response.should redirect_to(jobs_path)
    end
    it 'should return to login page if invalid' do
      User.should_receive(:login).with("bad","login").and_return(false)
      post :create, {:session => {'email' => "bad", 'password' => "login"}}
      response.should redirect_to(login_path)
    end
  end
  
  describe 'logout' do
    it 'should destroy session and go to home page' do
      @request.env["HTTP_REFERER"] = 'http://test.host/jobs'
      delete :destroy
      response.should redirect_to(:back)
    end
  end
end
