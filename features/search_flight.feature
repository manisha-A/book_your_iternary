Feature: Search a flight between source and destination

  Scenario: As a user, I should be able to search flight options between source and destination
    Given I am on home page
    When I search one way flight between "ATL" and "LHR"
    Then I should be able to view available flight options