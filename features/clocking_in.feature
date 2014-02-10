Feature: Clocking in

  As an hourly consultant
  I want to mark the time I start work
  So that I can calculate my hours and bill them to my clients.

  Scenario: user is out

    Given I am currently out
    When I clock in
    Then my username and time in should be posted on my timesheet

  Scenario: user is in

    If I haven't clocked out from my last session,
    I want to be notified when I try to clock in again
    So I can correct my mistake

    Given I am currently in
    When I clock in
    Then I should see a message notifying me I am already clocked in
    And I should be asked if I want to continue, clock out, or exit