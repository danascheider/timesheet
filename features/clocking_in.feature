Feature: Clocking in and out
  
  Consultants tracking their working time enter their time in on
  their timesheet

  Background:

    Given I am a timesheet user

  Scenario: User clocks in

    When I clock in
    Then my username and time in should be posted to my timesheet

  Scenario: User clocks out

    When I clock out
    Then my username and time out should be posted to my timesheet