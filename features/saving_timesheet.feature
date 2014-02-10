# Timesheet should create and maintain a directory called ~/.timesheet
# with the user's ins and outs recorded in a file called ~/.timesheet/timesheet

Feature: timesheet saves timesheet

  timesheet saves a log called .timesheet/timesheet in the user's
  home directory

  Scenario: no timesheet directory
    Given there is no directory called "~/.timesheet"
    When I clock in
    Then a directory called "~/.timesheet" should be created
    And a file called "~/.timesheet/timesheet" should be created
    And the time should be appended to the file "~/.timesheet/timesheet"

  Scenario: no timesheet file
    Given there is a directory called "~/.timesheet"
    But there is no file called "~/.timesheet/timesheet"
    When I clock in
    Then a file called "~/.timesheet/timesheet" should be created
    And the time should be appended to the file "~/.timesheet/timesheet" 

  Scenario: existing timesheet file and directory
    Given there is a directory called "~/.timesheet"
    And there is a file called "~/.timesheet/timesheet"
    When I clock in
    Then my time in should be appended to the file "~/.timesheet/timesheet"