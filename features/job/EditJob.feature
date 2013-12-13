Feature: edit a job

Scenario: edit a job

 Given my new account with name "test" and email "testing@uiowa.edu" and pws "123123"
 And I have login with email "testing@uiowa.edu" and pws "123123"
 And I click my name "test" at the right top and go to the user center
 And I have added a new job with Company name "Google" and Job Title "SD intern" and Job Description "testing and developing testing and developing testing and developing testing and developing testing and developing" and Job Requirements "BS UI students" and Desired Qualifications "PHP C++ Java" and city "San F" and state "Idaho" and Job-link on your website "http://www.baidu.com"

When I find the title "SD intern" and edited my job with Company name "Microsoft" and Job Title "AL intern" and Job Description "222testing and developing testing and developing testing and developing testing and developing testing and developing" and Job Requirements "MCS UI students" and Desired Qualifications "C PHP C++ Java" and city "San F" and state "Iowa" and Job-link on your website "http://www.google.com"

Then I should see a message "The job was successfully updated."
