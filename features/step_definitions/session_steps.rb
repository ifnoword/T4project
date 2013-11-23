# Completed step definitions for basic features: Create an account, Login 

Given /^I am on Name Home Page$/ do
  visit jobs_path
 end

When /^I have created an account with name "(.*?)" and email "(.*?)" and pws "(.*?)"$/ do |name,email,pwd| 
    visit  new_user_path
    fill_in 'user[name]', :with => name
    fill_in 'user[email]', :with => email
    fill_in 'user[password]', :with => pwd
    fill_in 'user[password_confirmation]', :with => pwd
    click_button 'Create my account' 
end

Then /^I should see a flash "(.*?)"$/ do |text|
    page.should have_content(text)
end

#------------------------login-----
Given /^my new account with name "(.*?)" and email "(.*?)" and pws "(.*?)"$/ do |name,email,pwd|
    tmp = {:email => email,:name => name, :password => pwd, :password_confirmation =>pwd}
    User.create_user!(tmp)
end

When(/^I have login with email "(.*?)" and pws (.*?)$/) do |email , pwd|
    visit login_path
    fill_in 'session[email]', :with => email
    fill_in 'session[password]', :with => pwd
    #@current_user = Factory(:email => email)
    click_button 'Login'
end


Then /^I should see email "(.*?)" and "(.*?)"$/ do |text,name|
    page.should have_content(text)
    page.should have_content(name)
 end

When /^I click the Sign Out link$/ do
   click_link "Sign Out"
end

Then /^I should be redirected to home page to see the "(.*?)" again$/ do |text|
   page.should have_content(text)
end





