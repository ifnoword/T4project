Feature: edit my profile

Scenario: Edit my profile in user center

 Given my new account with name "test" and email "testing@uiowa.edu" and pws "123123"
 And I have login with email "testing@uiowa.edu" and pws "123123"
 And I have created my profile with name "Hao" and edit personalDes "BS student" and alternateEmail "test@uiowa.edu" and telephone to "3194001000" and addressline1 "W Benten Seville APT" and addressline2 "123R" and city "SF" and state "Idaho" and zipcode "52356"



 When I have edited my name "Hao Zheng" and edit personalDes "MCS student" and alternateEmail "hao-zheng@uiowa.edu" and telephone to "3194008000" and addressline1 "W Benten St Seville APT" and addressline2 "909R" and city "Iowa city" and state "Iowa" and zipcode "52246"

 Then I should see a profile list entry with new info name "Hao Zheng" and edit personalDes "MCS student" and alternateEmail "hao-zheng@uiowa.edu" and telephone to "3194008000" and addressline1 "W Benten St Seville APT" and addressline2 "909R" and city "Iowa city" and state "Iowa" and zipcode "52246" and see a message "Your profile was successfully updated."
