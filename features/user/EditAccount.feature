Feature: edit my account info

Scenario: Edit my account (email,pwd) in user center

 Given my new account with name "test" and email "testing@uiowa.edu" and pws "123123"
 And I have login with email "testing@uiowa.edu" and pws "123123"
 And I click my name "test" at the right top and go to the user center


When I have edit my account with email "hao-zheng@uiowa.edu" and input old pwd "123123" and input new pwd "123123123" and confirm new pwd "123123123"

 Then I see a message "Your account was successfully updated."



