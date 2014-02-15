require 'log'
require 'user'

Given /^I am a timesheet user$/ do 
  @user = User.new
  @username = @user.name
end

When /^I clock in$/ do 
  `bundle exec bin/timesheet in`
end

When /^I clock out$/ do 
  `bundle exec bin/timesheet out`
end

Then /^my username and time in should be posted to my timesheet$/ do 
  File.open("/home/#{@username}/.timesheet/timesheet",'r+') do |file|
    IO.readlines(file)[-1].should eql "#{@username} in  => #{Time.now}\n"
  end
end

Then /^my username and time out should be posted to my timesheet$/ do 
  File.open("/home/#{@username}/.timesheet/timesheet",'r+') do |file|
    IO.readlines(file)[-1].should eql "#{@username} out => #{Time.now}\n"
  end
end