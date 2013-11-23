require 'spec_helper'

describe ProfilesController do
  describe 'show' do
    it 'should redirect to show' do
      fake_user = double('user1')
      fake_user.should_receive(:profile)
      controller.instance_variable_set(:@current_user, fake_user)
      post :show, {:id => "1"}
      response.should render_template('show')
    end
  end
  describe 'update' do
    it 'should get edit page' do
      fake_user = double('user1')
      fake_user.should_receive(:profile)
      controller.instance_variable_set(:@current_user, fake_user)
      post :edit, {:id => "1"}
      response.should render_template('edit')
    end
    it 'should update database' do
      fake_user = double('user1')
      fake_profile = double('profile1')
      fake_errors = double('errors1')
      fake_messages = double('messages1')
      Profile.should_receive(:update_profile).and_return(fake_profile)
      fake_profile.should_receive(:errors).and_return(fake_errors)
      fake_errors.should_receive(:messages).and_return(fake_messages)
      fake_messages.should_receive(:size).and_return(0)
      fake_user.should_receive(:profile).and_return(fake_profile)
      controller.instance_variable_set(:@current_user, fake_user)
      post :update, {:id => "1"}
      response.should redirect_to(profile_path(fake_profile))
    end
    it 'should throw error if fail' do
      fake_user = double('user1')
      fake_profile = double('profile1')
      fake_errors = double('errors1')
      fake_messages = double('messages1')
      Profile.should_receive(:update_profile).and_return(fake_profile)
      fake_profile.should_receive(:errors).and_return(fake_errors)
      fake_errors.should_receive(:messages).and_return(fake_messages)
      fake_messages.should_receive(:size).and_return(1)
      fake_user.should_receive(:profile).and_return(fake_profile)
      controller.instance_variable_set(:@current_user, fake_user)
      post :update, {:id => "1"}
      response.should render_template('edit')
    end
  end
end
