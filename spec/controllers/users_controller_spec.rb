require 'spec_helper'

describe UsersController do
  describe 'creating an account' do
    it 'should use create_user model method to check for proper values' do
      User.should_receive(:create_user!).with("this_user")
      post :create, {:user => "this_user"}
    end
    describe'if the values are invalid' do
      before :each do
        User.should_receive(:create_user!).with("this_user").and_return(:class => "null")
      end
      it 'should redirect to new_user_path with error messages' do
        post :create, {:user => "this_user"}
        response.should redirect_to(new_user_path)
      end
    end
    describe 'if the values are valid' do
      before :each do
        fake_user = double('user1')
        fake_user.stub(:class).and_return(User)
        fake_user.stub(:email).and_return("this_user")
        User.should_receive(:create_user!).with("this_user").and_return(fake_user)
      end
      it 'should add new user to database and return to home page with confirmation' do
        post :create, {:user => "this_user"}
        response.should redirect_to(jobs_path)
      end
    end
  end
  
  describe 'editing a profile' do
    it 'should generate the edit page with the current info' do
      post :edit, {:id => "1"}
      response.should render_template('edit')
    end
    it 'should update the database with the new values and redirect to users profile' do
      pending("not implemented yet") #pending
      fake_user = double('user2')
      fake_user.should_receive(:update_attributes!)
      fake_user.stub(:name).and_return("this_user")
      User.should_receive(:find).with("1").and_return(fake_user)
      post :update, {:id => "1", :user => "this_user"}
      response.should redirect_to(user_path)
    end
  end
end
