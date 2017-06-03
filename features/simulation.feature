Feature: Simulation

  Background:
    When I run `./simulate.rb` interactively

  Scenario: Places toy robot on the table and commands it
    When I type "PLACE 0,0,NORTH"
    And I type "MOVE"
    And I type "MOVE"
    And I type "MOVE"
    And I type "MOVE"
    And I type "REPORT"
    And I type "RIGHT"
    And I type "MOVE"
    And I type "MOVE"
    And I type "MOVE"
    And I type "MOVE"
    And I type "REPORT"
    And I type "RIGHT"
    And I type "MOVE"
    And I type "MOVE"
    And I type "MOVE"
    And I type "MOVE"
    And I type "REPORT"
    And I type "LEFT"
    And I type "REPORT"
    And I type "EXIT"
    Then the output should contain "0,4,NORTH"
    And the output should contain "4,4,EAST"
    And the output should contain "4,0,SOUTH"
    And the output should contain "4,0,EAST"
    And it should pass with "Thanks for using Toy Robot Simulator. Have a nice day! :)"

  Scenario: Places robot oustide the boundary of the table
    When I type "PLACE 5,5,EAST"
    And I type "REPORT"
    And I type "EXIT"
    Then the output should contain "Ignored. Robot will fall off the table."
    And the output should not contain "5,5,EAST"

  Scenario: Places robot on the table but commands it to fall off table
    When I type "PLACE 0,0,NORTH"
    And I type "MOVE"
    And I type "MOVE"
    And I type "MOVE"
    And I type "MOVE"
    And I type "MOVE"
    And I type "REPORT"
    And I type "EXIT"
    Then the output should contain "Ignored. Robot will fall off the table."
    And the output should contain "0,4,NORTH"

  Scenario: Commands a robot to move but it's not on the table yet
    When I type "MOVE"
    And I type "EXIT"
    Then the output should contain "Ignored. Robot is not on the table yet."

  Scenario: Commands a robot to move but it's not on the table yet
    When I type "MOVE"
    And I type "EXIT"
    Then the output should contain "Ignored. Robot is not on the table yet."

  Scenario: Commands a robot to report but it's not on the table yet
    When I type "REPORT"
    And I type "EXIT"
    Then the output should contain "Ignored. Robot is not on the table yet."

  Scenario: Commands a robot to rotate to the left but it's not on the table yet
    When I type "LEFT"
    And I type "EXIT"
    Then the output should contain "Ignored. Robot is not on the table yet."

  Scenario: Commands a robot to rotate to the right but it's not on the table yet
    When I type "RIGHT"
    And I type "EXIT"
    Then the output should contain "Ignored. Robot is not on the table yet."
