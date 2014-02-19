Feature: User Log out
  The ability to log out

  Background:
    When I go to sign up
    And I fill in the following:
      | email                 | pete@pez.com |
      | name                  | Peter        |
      | username              | Pickleaddict |
      | password              | a123         |
      | password_confirmation | a123         |
    And I press "Sign up"
    Then I should be added as a chitter user
    When I go to log in
    Then I should see "Log in"
    And I fill in the following:
    | username              | Pickleaddict |
    | password              | a123         |
    And I press "Log in"
    Then I should see "Welcome Pickleaddict"
    And I should see "Log out"

  Scenario:
    When I follow "Log out"
    Then I should see "Log in"
