#--------------------------edit profile

Given /^I have created my profile with name "(.*?)" and edit personalDes "(.*?)" and alternateEmail "(.*?)" and telephone to "(.*?)" and addressline1 "(.*?)" and addressline2 "(.*?)" and city "(.*?)" and state "(.*?)" and zipcode "(.*?)"$/ do |name,pd,ae,tele,addr1,addr2,city,state,zip|
  visit ('/users/1')
  click_link "My Profile"
  click_button "Edit"
  fill_in 'profile[name]', :with => name
  fill_in 'profile[desc]', :with => pd
  fill_in 'profile[altemail]', :with => ae
  fill_in 'profile[tel]', :with => tele
  fill_in 'profile[addr1]', :with => addr1
  fill_in 'profile[addr2]', :with => addr2
  fill_in 'profile[city]', :with => city
  select(state,:from =>'profile[state]')
  fill_in 'profile[zipcode]', :with => zip
  click_button 'Save Changes'
 end

 When /^I have edited my name "(.*?)" and edit personalDes "(.*?)" and alternateEmail "(.*?)" and telephone to "(.*?)" and addressline1 "(.*?)" and addressline2 "(.*?)" and city "(.*?)" and state "(.*?)" and zipcode "(.*?)"$/ do |name,pd,ae,tele,addr1,addr2,city,state,zip|

  visit ('/users/1')

  click_link "My Profile"
  click_button "Edit"
  fill_in 'profile[name]', :with => name
  fill_in 'profile[desc]', :with => pd
  fill_in 'profile[altemail]', :with => ae
  fill_in 'profile[tel]', :with => tele
  fill_in 'profile[addr1]', :with => addr1
  fill_in 'profile[addr2]', :with => addr2
  fill_in 'profile[city]', :with => city
  select(state,:from =>'profile[state]')
  fill_in 'profile[zipcode]', :with => zip
  click_button 'Save Changes'

end

 Then /^I should see a profile list entry with new info name "(.*?)" and edit personalDes "(.*?)" and alternateEmail "(.*?)" and telephone to "(.*?)" and addressline1 "(.*?)" and addressline2 "(.*?)" and city "(.*?)" and state "(.*?)" and zipcode "(.*?)" and see a message "(.*?)"$/ do |name,pd,ae,tele,addr1,addr2,city,state,zip,msg|

  page.should have_content(name)
  page.should have_content(pd)
  page.should have_content(ae)
  page.should have_content(tele)
  page.should have_content(addr1)
  page.should have_content(addr2)
  page.should have_content(city)
  page.should have_content(state)
  page.should have_content(zip)
  page.should have_content(msg)

end
