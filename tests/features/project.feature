@var newProjectDescription = 'New project description'
@var newProjectName = 'Project {random(7)}'

Feature: Project Management

@projects
Scenario: Create new project
  Given I am logged in
  When I am on dashboard page
  And I remove existing project if any is assigned (select in project list and go to project settings page to see remove button)
  Then I should see message about No Project Selected 
  When I create project with name &projectName and description &projectDescription
  Then I should see &projectName as my active project
  When I navigate to project settings page
  Then I should see project name &projectName and description &projectDescription
  When I attempt to create another project with any random new name and description (until I see validation message in modal)
  Then I should see validation message about project limit for my tier

@projects
Scenario: Edit project
  Given I am logged in
  And I have project assigned
  When I navigate to project settings page
  And I update project name to &newProjectName and description to &newProjectDescription
  Then I should see &newProjectName as my active project
  When I navigate to project settings page
  Then I should see project name &newProjectName and description &newProjectDescription

@projects
Scenario: Remove project
  Given I am logged in
  And I have project assigned
  When I navigate to project settings page
  And I navigate to dashboard page
  Then I should see 'No Project Selected' message
  When I create project with name &projectName and description &projectDescription
  Then I should see &projectName as my active project




