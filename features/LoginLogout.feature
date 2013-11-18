Feature: Login to an account

Scenario: Login to an account of Name

 Given my new account with name "test" and email "testing@uiowa.edu" and pws "123123"

 When I have login with email "testing@uiowa.edu" and pws "123123"
 Then I should see email "Welcome! testing@uiowa.edu"

 When I click the Sign Out link
 Then I should be redirected to home page to see the "Login/Register" again
