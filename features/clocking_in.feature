Feature: Clocking in

  Users are consultants who use Timesheet to log hours working for
  control or billing purposes. When a user clocks in, an entry is
  made in a log file indicating his/her username and the time and
  date entered

  Scenario: user is out

    Given I am currently out
    When I clock in
    Then my username and time in should be posted on my timesheet

  Scenario: user is in

    Given I am currently in
    When I clock in
    Then I should see a message notifying me I am already clocked in
    And I should be asked if I want to continue, clock out, or exit