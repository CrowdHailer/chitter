Feature: User Log in
	This set of scenarios ensures that a previously signed up user can log in

	Background:
		When I go to sign up
		And I fill in the following:
			| email 								| pete@pez.com |
			| name 									| Peter 			 |
			| username							| Pickleaddict |
			| password 							| a123 				 |
			| password_confirmation | a123				 |
		And I press "Sign up"
		Then I should be added as a chitter user

	Scenario: Correct log in details
		When I go to log in
		And I fill in the following:
		| username							| Pickleaddict |
		| password 							| a123 				 |
		And I press "Log in"
		Then I should see "Welcome Pickleaddict"

	Scenario: Incorrect password
		When I go to log in
		And I fill in the following:
		| username							| Pickleaddict |
		| password 							| a124 				 |
		And I press "Log in"
		Then I should see "Incorrect Username or Password"

	Scenario: Nonexistant username
		When I go to log in
		And I fill in the following:
		| username							| Dave				 |
		| password 							| a123 				 |
		And I press "Log in"
		Then I should see "Incorrect Username or Password"
