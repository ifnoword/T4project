require 'spec_helper'

describe UsersController do
  describe 'non-filter methods' do
    before(:each) do
      controller.class.skip_before_filter :sign_in
      controller.class.skip_before_filter :correct_user
    end
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
        it 'should add new user to database and return to home page with confirmation' do
          fake_user = double('user1')
          fake_user.stub(:class).and_return(User)
          fake_user.stub(:email).and_return("this_user")
          User.should_receive(:create_user!).with("this_user").and_return(fake_user)
          post :create, {:user => "this_user"}
          response.should redirect_to(user_path(fake_user))
        end
      end
    end
  
    describe 'editing a profile' do
      it 'should generate the edit page with the current info' do
        post :edit, {:id => "1"}
        response.should render_template('edit')
      end
      it 'should update the database with the new values and redirect to users profile' do
        fake_user = double('user2')
        User.should_receive(:update_attrbs).and_return(fake_user)
        fake_user.stub(:name).and_return("this_user")
        fake_user.should_receive(:class).at_least(:once).and_return(User)
        fake_user.should_receive(:email).at_least(:once).and_return("this@this.com")
        User.should_receive(:find).with("1").and_return(fake_user)
        post :update, {:id => "1", :user => "this_user"}
        response.should redirect_to(edit_user_path(fake_user))
      end
      it 'should give error if values arent correct' do
        fake_user = double('user3')
        User.should_receive(:update_attrbs).and_return(fake_user)
        fake_user.stub(:name).and_return("this_user")
        fake_user.should_receive(:class).at_least(:once).and_return(nil)
        User.should_receive(:find).with("1").and_return(fake_user)
        post :update, {:id => "1", :user => "this_user"}
        response.should render_template('edit')
      end
    end
    describe 'myjobs' do
      
      it 'should go to myjobs page' do
	pending ("wont identify myjobs path") #pending
        post :myjobs
        response.should redirect_to(myjobs_path)
      end
    end
  end
end



#describe UsersController do
#  describe 'before filter error checking' do
#    it 'should go to login page if no user logged in' do
#      post :create, {:this => "this"}
#      response.should redirect_to(login_path)
#    end
#    it 'should check if user is only viewing own page'
#  end 
#end
