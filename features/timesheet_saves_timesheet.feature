# Timesheet should create and maintain a directory called ~/.timesheet
# with the user's ins and outs recorded in a file called ~/.timesheet/timesheet

Feature: timesheet saves timesheet
  In order to keep a record of my hours
  As an hourly consultant
  I want a timesheet saved on my computer

  Scenario: timesheet creates timesheet
    Given there is no directory called "~/.timesheet"
    When I clock in
    Then a directory called "~/.timesheet" should be created
    And the time should be logged in a file called "~/.timesheet/timesheet"