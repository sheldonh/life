Feature: game loop
  In order to see life
  The operator
  Ages an organism through a game loop

  Scenario: run game loop
    Given an organism
    When I wrap the organism in a game
    And I run the game
    Then the game ages the organism until the organism dies

