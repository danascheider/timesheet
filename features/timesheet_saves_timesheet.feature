# Timesheet should create and maintain a directory called ~/.timesheet
# with the user's ins and outs recorded in a file called ~/.timesheet/timesheet

Feature: saves timesheet
  In order to keep a record of my hours
  As an hourly consultant
  I want a timesheet saved on my computer

  Scenario: generate timesheet file and directory
    Given there is no directory called .timesheet
    When I clock in
    Then I should have a directory called .timesheet
    And there should be a file called timesheet in .timesheet
    And the current time and date should be recorded in .timesheet/timesheetl 