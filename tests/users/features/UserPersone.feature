@UserPerson
Feature: UserPerson
  Changing information in the profile

  Background:
    Given I am on the user person page

    Scenario: Name Change
      When I change the name
        And click save button
      Then name must be preserved
      When I refresh page
      Then name should not change
      Then I revert name

   Scenario: Surname Change
     When I change the surname
       And click save button
     Then surname must be preserved
     When I refresh page
     Then surname should not change
     Then I revert surname