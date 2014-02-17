Feature: User Sign up
	This set of scenarios is to cover the responses expected when a new user signs up to the chitter service

	Scenario: Enter valid user details
		When I go to sign up
		And I fill in the following:
			| email 								| pete@pez.com |
			| name 									| Peter 			 |
			| username							| Pickleaddict |
			| password 							| a123 				 |
			| password_confirmation | a123				 |
		And I press "Sign up"
		Then I should be added as a chitter user

	Scenario: Password confirmation does not match
	When I go to sign up
		And I fill in the following:
			| email 								| pete@pez.com |
			| name 									| Peter 			 |
			| username							| Pickleaddict |
			| password 							| a123 				 |
			| password_confirmation | incorrect		 |
		And I press "Sign up"
		Then I should not be added as a chitter user

	Scenario: Double sign up
		Given I am already a maker
		When I go to sign up
		And I fill in the following:
			| email 								| pete@pez.com |
			| name 									| Peter 			 |
			| username							| Pickleaddict |
			| password 							| a123 				 |
			| password_confirmation | a123				 |
		And I press "Sign up"
		Then I should not be added as a chitter user



