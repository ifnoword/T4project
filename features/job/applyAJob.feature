Feature: apply a job

Scenario: apply a job from employers

 Given my new account with name "test" and email "testing@uiowa.edu" and pws "123123"
 And I have login with email "testing@uiowa.edu" and pws "123123"
 And I click my name "test" at the right top and go to the user center
 And I have added a new job with Company name "MNM" and Job Title "SD intern" and Job Description "testing and developing testing and developing testing and developing testing and developing testing and developing" and Job Requirements "BS UI students" and Desired Qualifications "PHP C++ Java" and city "San F" and state "Idaho" and Job-link on your website "http://www.baidu.com"
And I am on ExternMe Home Page
And I search the job with "MNM" and click the search button

And I click the "SD intern" link
And I click "Apply Now" button

Then I should visit "http://www.baidu.com"
