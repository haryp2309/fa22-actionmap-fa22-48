Feature: Clicking on a county in the county map should show their representatives 
  As a user
  I want to find my representative in my county
Background: Representatives in my county
  Given the representatives exist:
  | name                        | divisionId                        |office|
  | Joseph R. Biden             | ocd-division/country:us           | President of the United States|
  | Kamala D. Harris            | ocd-division/country:us           | Vice President of the United States|
  | Alex Padilla                | ocd-division/country:us/state:ca  | U.S. Senator|


Scenario: Clicking on San Francisco county should show 26 representatives
  Given I am on the home page
  When I navigate to the San Francisco County in California
  Then I should see the representatives: "Joseph R. Biden","Kamala D. Harris","Alex Padilla" 