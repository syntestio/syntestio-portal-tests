@Given("I am logged in")
When I navigate to login page
And I log in as &userEmail with password &password until I am on dashboard page (using the visible Submit button, not the aria-hidden one)
And I accept cookie consent if displayed

@Given("I have project assigned")
When I am on dashboard page
And I create project with name &projectName and description &projectDescription if no project is selected in the side navigation menu, otherwise I skip this step
Then I should see &projectName as my active project
