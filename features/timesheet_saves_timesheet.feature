# Check how it works

Feature: saves timesheet
  In order to keep a record of my hours
  As an hourly consultant
  I want a timesheet saved on my computer

  Scenario: generate timesheet file and directory
    Given no directory called .timesheet
    And no file called .timesheet
    When I clock in
    Then I should have a directory called .timesheet
    And there should be a file called timesheet in .timesheet
    And the current time and date should be recorded in .timesheet/timesheet