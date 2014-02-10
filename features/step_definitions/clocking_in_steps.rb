Given /^I am a Timesheet user$/ do 
  @user = User.new('test_user')
end

Given /^I am currently (in|out)$/ do |status|
  @user.status == status
end

When /^I clock (in|out)$/ do |action|
  @action = `bundle exec bin/timesheet -u dscheider #{action} -t '2014-02-07 17:27:00 -0800'`
end

Then /^my username and time (in|out) should be posted on my timesheet$/ do |status|
  # TODO: code goes here
end

Then /^I should see a message that I am already (clocked)? (in|out)$/ do |status|
  # TODO: code goes here
end

And /^I should be asked what I want to do next$/ do
  # TODO: code goes here
end