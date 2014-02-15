require 'log'
require 'user'

Given /^I am a timesheet user$/ do 
  @user = User.new
  @username = @user.name
end

When /^I clock (in|out)$/ do |status|
  `bundle exec bin/timesheet #{status}`
end

Then /^my username and time (in|out) should be posted to my timesheet$/ do |status|
  File.open("/home/#{@username}/.timesheet/timesheet",'r+') do |file|
    IO.readlines(file)[-1].should eql "#{@username} #{status} => #{Time.now}\n"
  end
end