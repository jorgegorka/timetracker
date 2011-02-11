Feature: Users can login
  In order to enter the application
  As an user
  I want to login

  Scenario: User can create a labor
    Given I go to the logout page
    And   I go to the login page
    When  I fill in "email" with "user@test.com"
    And   I fill in "password" with "123456"
    And   I press "Acceder a mi cuenta"
    Then  I should see "Logged in successfully"
