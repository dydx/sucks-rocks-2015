Feature: Users can learn how good something is

  @user-compares-two-terms
  Scenario: User compares two terms
    When I search for microsoft
    And I search for apple
    Then microsoft should have a higher score than apple

  Scenario: Why are the results for apple and microsoft so close?
    When pending
