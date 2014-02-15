Feature: Clocking in and out
  
  Consultants tracking their working time enter their time in on
  their timesheet

  Background:

    Given I am a timesheet user

  Scenario: User clocks in

    When I clock in
    Then my username and time in should be posted to my timesheet

  Scenario: Time in differs from present time

    When I clock in
    And I specify a time using the -t option
    Then that time should be posted to my timesheet

  Scenario: User clocks out

    When I clock out
    Then my username and time out should be posted to my timesheet