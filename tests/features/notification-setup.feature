Feature: Notification Preferences

Background: 
  Given I am logged in

@notifications
Scenario: Toggle notification settings
  When I navigate to profile page (settings) from account menu (top right corner in header)
  And I enable all notification options if disabled
  And I save changes
  And I navigate to dashboard
  And I navigate to profile page (settings) from account menu (top right corner in header)
  Then I should see all notification options enabled
  When I disable all notification options if enabled
  And I save changes
  And I navigate to dashboard
  And I navigate to profile page (settings) from account menu (top right corner in header)
  Then I should see all notification options disabled




