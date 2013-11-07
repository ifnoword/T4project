require 'spec_helper'

describe User do

    before :each do
      params = {:name => "Mr. User", :email => "user@user.com", :password => "password"}
      @user = User.create_user!(params)

    end

  describe 'log in' do

    it 'should log in a user if the information is correct' do

    end

    it 'should deny log in if the information is incorrect' do

    end

  end#log in



  describe 'create a new user' do

    it 'should check the password length' do
      errs = Hash.new

      params = {:name => "Mrs. User", :email => "test@test.com", :password => "pass"}
      @user2 = User.create_user!(params)


      if(params[:password].size < 6)
        errs['password'].should_not == nil
      end

      if(errs.size == 0)

      end
    
    end

  end#create user


  
end#User
