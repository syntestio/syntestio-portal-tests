@var newRegisteredAccountEmail = 'syntestioTest{random(7)}@gmail.com'

Feature: Authentication

@login
Scenario: Navigate to login page
  When I navigate to login page
  Then I should be on the login page

@login
Scenario: Successful login
  Given I am logged in
  Then I should see tiers page or dashboard page

@login
Scenario: Unsuccessful login
  When I navigate to login page
  And I enter invalid credentials 'invalid{random(7)}@gmail.com' and 'invalidPassword123!'
  And I click on 'Continue' button until I see error message (using the visible Submit button, not the aria-hidden one)
  Then I should see login error message

@register
Scenario: Register new user and then remove account
  When I navigate to login page
  And I create account with email &newRegisteredAccountEmail and password '&password' until I see select tier page (using the visible Submit button, not the aria-hidden one)
  Then I should see tiers page
  When I select free tier
  Then I should see dashboard page
  When I navigate to profile settings from account menu (top right corner in header)
  And I Delete my account (until I am on login page)
  Then I try to login with credentials '&newRegisteredAccountEmail' and password '&password' (using the visible Submit button, not the aria-hidden one) until I can see error login message
  Then I should see login error message
