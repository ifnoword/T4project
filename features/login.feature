Feature: Login to an account

Scenario: Login to an account of Name

 Given I have created an account with name "test" and email "test@test.com" and pws "test"
 And I have visited the Login page

 When I have login with email "test@uiowa.edu" and pws "test"
 And I am on Name Home Page    
 Then I should see email "testing@uiowa.edu"
