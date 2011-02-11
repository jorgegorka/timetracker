Given /^I am a visitor/ do
  steps %Q{
    Given I go to the logout page
  }
end

Given /^I am an admin$/ do
  steps %Q{
    Given I go to the logout page
    And   I go to the login page
    And   I fill in "email" with "admin@test.com"
    And   I fill in "password" with "123456"
    And   I press "Acceder a mi cuenta"
  }
end

Given /^I am an user$/ do
  steps %Q{
    Given I go to the logout page
    And   I go to the login page
    And   I fill in "email" with "user@test.com"
    And   I fill in "password" with "123456"
    And   I press "Acceder a mi cuenta"
  }
end

Given /^I am a poster$/ do
  steps %Q{
    Given I go to the logout page
    And   I go to the login page
    And   I fill in "email" with "poster@test.com"
    And   I fill in "password" with "123456"
    And   I press "Acceder a mi cuenta"
  }
end
