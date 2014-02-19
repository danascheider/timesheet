Feature: Clocking in and out
  
  Consultants tracking their working time enter their time in on
  their timesheet

  Background:

    Given I am a timesheet user

  Scenario: User clocks in

    When I clock in
    Then my username and time in should be posted to my timesheet

  Scenario: Time in differs from present time

    When I clock in with the time set to 2014-02-15 11:30:00 -0800
    Then the time in on my timesheet should be 2014-02-15 11:30:00 -0800

  Scenario: User clocks out

    When I clock out
    Then my username and time out should be posted to my timesheet

  Scenario: Time out differs from present time

    When I clock out with the time set to 2013-11-27 12:37:00 -0800
    Then the time out on my timesheet should be 2013-11-27 12:37:00 -0800