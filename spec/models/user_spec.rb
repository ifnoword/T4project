require 'spec_helper'

describe User do

    before :each do
      params = {:name => "Mr. User", :email => "user@user.com", :password => "password", :password_confirmation => "password"}
      @user = User.create_user!(params)
    end

  describe 'log in' do

    it 'should log in a user if the information is correct' do
      @userlogin = User.login("user@user.com", "password")#correct info
      @userlogin.should == @user #so the user should be logged on
    end

    it 'should deny log in if the information is incorrect' do
      @userlogin = User.login("wrong@user.com", "wrongpassword")#incorrect info
      @userlogin.should == false #no login!
    end

  end#log in



  describe 'create a new user' do

    before :each do
      @params = {:name => "Mrs. User", :email => "test@test.com", :password => "password", :password_confirmation => "password"}
    end

    it 'should check if the information is valid' do
      @params[:name] = "This string is much to long to be a valid account name!"
      @params[:email] = "invalid"

      @user2 = User.create_user!(@params)

      @user2.has_key?('name').should == true #error. name is too long
      @user2.has_key?('email').should == true #error. email is invalid
    end

    it 'should check if the password is empty' do
      @params[:password] = ""
      @params[:password_confirmation] = ""

      @user2 = User.create_user!(@params)

      @user2.has_key?('password').should == true #should have pw error (empty field)
      @user2.has_key?('password_confirmation').should == false #passwords match. no error here
    end

    it 'should check that the password length is 6 or more characters' do
      @params[:password] = "pass"
      @params[:password_confirmation] = "pass"

      @user2 = User.create_user!(@params)

      @user2.has_key?('password').should == true #should have pw error (empty field)
      @user2.has_key?('password_confirmation').should == false #passwords match. no error here
    end

    it 'should make sure the passwords match' do
      @params[:password_confirmation] = "wrongpassword"

      @user2 = User.create_user!(@params)

      @user2.has_key?('password').should == false #password is valid
      @user2.has_key?('password_confirmation').should == true #error! passwords don't match
    end

    it 'should make a new user if there are no errors' do

      @user2 = User.create_user!(@params)

      @user2[:email].should == "test@test.com"
      @user2[:name].should == "Mrs. User"
      @user2[:password_digest].should == Digest::SHA256.hexdigest("test@test.com" + "password")
    end




  end#create user


  
end#User
