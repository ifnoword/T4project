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
    #puts text
    #puts text
    #visit(jobs_path)
    page.html.should have_content(text)
 end





