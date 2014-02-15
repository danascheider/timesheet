Given /^I am a timesheet user$/ do 
  @user = User.new
  @username = @user.name
end

When /^I clock in$/ do 
  `bundle exec bin/timesheet in`
end

Then /^My username and time in should be posted to my timesheet$/ do 
  # TODO
end