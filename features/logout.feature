Feature: Logout of an account 

Background:  Given I have login with email "test@uiowa.edu" and pws "test"

Scenario: 
        When I click on "Sign Out" link
	Then I should be logged out

