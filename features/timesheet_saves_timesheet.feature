# Timesheet should create and maintain a directory called ~/.timesheet
# with the user's ins and outs recorded in a file called ~/.timesheet/timesheet

Feature: timesheet saves timesheet

  In order to keep a record of my hours
  As an hourly consultant
  I want a timesheet saved on my computer

  Scenario: no timesheet directory
    Given there is no directory called "~/.timesheet"
    When I clock in
    Then a directory called "~/.timesheet" should be created
    And a file called "~/.timesheet/timesheet" should be created
    And the time should be appended to the file "~/.timesheet/timesheet"

  Scenario: no timesheet file
    Given there is a directory called "~/.timesheet"
    But there is no timesheet file
    When I clock in
    Then a file called "~/.timesheet/timesheet" should be created
    And the time should be appended to the file "~/.timesheet/timesheet" 

  Scenario: existing timesheet file and directory
    Given there is a directory called "~/.timesheet"
    And there is a file called "~/.timesheet/timesheet"
    When I clock in
    Then my time in should be appended to the file "~/.timesheet/timesheet"

  Scenario: clock out
    Given there is a file called "~/timesheet/timesheet"
    When I clock out
    Then my time out should be appended to the file "~/.timesheet/timesheet"

  Scenario: clock out when not clocked in on timesheet
    Given there is a file called "~/.timesheet/timesheet"
    And the most recent entry in the file is a clock-out
    When I clock out
    Then I should see a message indicating I am not clocked in
    And I should be asked if I want to continue

  Scenario: clock out when there is a timesheet directory but no file
    Given there is a directory called "~/.timesheet"
    But there is no file called "~/.timesheet/timesheet"
    When I clock out
    Then I should see a message indicating I do not have an open timesheet
    And I should be asked if I want to continue

  Scenario: clock out when there is no timesheet directory
    Given there is no directory called "~/.timesheet"
    When I clock out
    Then I should see a message indicating I do not have an open timesheet
    And I should be asked if I want to continue

  Scenario: continue with clock-out
    Given I have clocked out when I wasn't clocked in
    And I have been asked whether I want to continue
    When I answer yes
    Then my time out should be logged in the file "~/.timesheet/timesheet"