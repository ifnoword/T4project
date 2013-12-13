Feature: search a job

Scenario: search a job in home page

 Given my new account with name "test" and email "testing@uiowa.edu" and pws "123123"
 And I have login with email "testing@uiowa.edu" and pws "123123"
 And I click my name "test" at the right top and go to the user center
 And I have added a new job with Company name "MNM" and Job Title "SD intern" and Job Description "testing and developing testing and developing testing and developing testing and developing testing and developing" and Job Requirements "BS UI students" and Desired Qualifications "PHP C++ Java" and city "San F" and state "Idaho" and Job-link on your website "http://www.baidu.com"
 And I am now in the user center
 And I have added a new job with Company name "Microsoft" and Job Title "SFD" and Job Description "testing and developing testing and developing testing and developing testing and developing testing and developing222" and Job Requirements "BS UI MS students" and Desired Qualifications "PHP C++ Java" and city "San F" and state "Idaho" and Job-link on your website "http://www.microsoft.com"
Given I am on ExternMe Home Page

When I search the job with "m" and click the search button

Then I should see a message "There are 2 results" and the job lists.
