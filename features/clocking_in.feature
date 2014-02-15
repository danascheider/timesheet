Feature: Clocking in
  
  Consultants tracking their working time enter their time in on
  their timesheet

  Scenario: User clocks in

    Given I am a timesheet user
    When I clock in
    Then my username and time in should be posted to my timesheet