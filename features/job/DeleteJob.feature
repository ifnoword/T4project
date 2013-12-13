Feature: delete a job

Scenario: delete a job in user center

 Given my new account with name "test" and email "testing@uiowa.edu" and pws "123123"
 And I have login with email "testing@uiowa.edu" and pws "123123"
 And I click my name "test" at the right top and go to the user center
 And I have added a new job with Company name "Google" and Job Title "SD intern" and Job Description "testing and developing testing and developing testing and developing testing and developing testing and developing" and Job Requirements "BS UI students" and Desired Qualifications "PHP C++ Java" and city "San F" and state "Idaho" and Job-link on your website "http://www.baidu.com"


When I delete the job which job title is "SD intern" and click the confirm button

Then I should see a message "Job SD intern was deleted."
