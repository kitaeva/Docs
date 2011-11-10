Feature: UserPerson
  Changing information in the profile

  Scenario: Name Change
    Given I am on the user person page
    When I change the name
      And click save button
    Then name must be preserved
    When I refresh page
    Then name should not change
    Then I revert name

#  Scenario: Surname Change
#    Given I am on the user person page
#    When I change the Surname
#      And click save button
#    Then Surname must be preserved
#    When I refresh page
#    Then Surname should not change
#    Then I revert surname