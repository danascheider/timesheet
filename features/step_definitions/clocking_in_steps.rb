require 'log'
require 'user'

Given /^I am a timesheet user$/ do 
  @user = User.new
  @username = @user.name
end

When /^I clock in$/ do 
  `bundle exec bin/timesheet in`
end

Then /^my username and time in should be posted to my timesheet$/ do 
  File.open("/home/#{@username}/.timesheet/timesheet",'r+') do |file|
    IO.readlines(file)[-1].should eql "#{@username} in  => #{Time.now}\n"
  end
end