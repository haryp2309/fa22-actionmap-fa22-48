Feature: Clicking sign in with a SSO provider should sign me in with a userid
    As a user
    I want to be able to sign in and out of the application

Scenario: Clicking "Sign in with Google" should sign me in with Google as SSO provider
    When I am signed in as a Google user
    And I am on the profile page
    Then I should see "Google Test Developer"

Scenario: Clicking "Sign in with Github" should sign me in with Github as SSO provider
    When I am signed in as a GitHub user
    And I am on the profile page
    Then I should see "Github Test Developer"

Scenario: Clicking "Logout" should sign you out
    Given I am signed in as a Google user
    And I am on the profile page
    And I follow "Logout"
    And I am on the login page
    Then I should see "Sign In"

