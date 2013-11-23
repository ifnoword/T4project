require 'spec_helper'

describe Profile do
  describe 'creating profile' do
    it 'should save profile in database' do
      fake_user = double('user1')
      fake_profile = double('profile1')
      fake_profile.stub(:[]=)
      fake_user.should_receive(:build_profile).and_return(fake_profile)
      fake_profile.should_receive(:valid?).and_return(true)
      fake_profile.should_receive(:save!)
      retval = Profile.creat_profile({:name => "name"}, fake_user)
      retval == fake_profile
    end
  end
  describe 'update profile' do
    it 'should update profile in database' do
      fake_profile = double('profile1')
      fake_errors = double('errors1')
      fake_profile.stub(:[]=)
      fake_profile.should_receive(:valid?).and_return(true)
      fake_profile.should_receive(:save!)
      fake_profile.should_receive(:errors).and_return(fake_errors)
      fake_errors.should_receive(:messages).and_return("that")
      retval = Profile.update_profile({:name => "name"}, fake_profile)
      retval == fake_profile
    end
  end
end
