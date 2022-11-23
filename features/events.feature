Feature: Navigating to the events page should let me view/filter/add events by state and county
  As a user
  I want to be able to view events in my state or county

Scenario: User should be able to view events
  Given I am on the home page
  When I am signed in as a Google user
  When I navigate to the events page
  Then I should see: "Name","State","County","Start Time","End Time","Description"

Scenario: User should be able to add events
  Given I am on the home page
  When I am signed in as a Google user
  When I navigate to the new events page
  Then I should see: "New event"

Scenario: Should reject invalid events and warn the user
  Given I am on the home page
  When I am signed in as a Google user
  When I navigate to the new events page
  And I press "Save"
  Then I should see: "County must exist","Start time must be after today"