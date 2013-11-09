Feature: Login to an account

Scenario: Login to an account of Name

 Given I have created an account with email "testing@uiowa.edu" 
 And I have visited the Login page

 When I have login with email "testing@uiowa.edu"
 And I am on Name Home Page    
 Then I should see email "testing@uiowa.edu"
