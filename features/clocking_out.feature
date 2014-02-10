Feature: 
  
  After a clocked-in and has finished working, they need to clock out in order
  to keep an accurate record of their hours.

  Scenario: user is in

    The basic scenario clocks out a user whose latest timesheet entry is 'in'

    Given I am currently in
    When I clock out
    Then my username and time out should be posted on my timesheet

  Scenario: user is out

    A user who has forgotten to clock in should see a message that they aren't
    currently clocked in, and they should be asked what they want to do

    Given I am currently out
    When I clock out
    Then I should see a message that I am already clocked out
    And I should be asked what I want to do next