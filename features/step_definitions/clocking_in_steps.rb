
Given /^I am currently (in|out)$/ do |status|
  # TODO: code goes here
end

When /^I clock (in|out)$/ do |action|
  @action = `bundle exec bin/timesheet -u dscheider #{action} -t '2014-02-07 17:27:00 -0800'`
end

Then /^my username and time (in|out) should be posted on my timesheet$/ do |status|
  # TODO: code goes here
end

Then /^I should see a message notifying me (that)? I am already (clocked)? (in|out)$/ do |status|
  # TODO: code goes here
end

And /^I should be asked if I want to (\w+), (\w+),? or (\w+)$/ do |option1,option2,option3|
  # TODO: code goes here
end