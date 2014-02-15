require 'log'
require 'user'

Given /^I am a timesheet user$/ do 
  @user = User.new
  @username = @user.name
end

When /^I clock (in|out)$/ do |status|
  `bundle exec bin/timesheet #{status}`
end

When /^I clock (in|out) with the time set to (\d{4}(\-\d\d){2} (\d{2}:){2}\d{2} \-\d{4})$/ do |status,date,time,zone|
  `bundle exec bin/timesheet #{status} -t "#{date} #{time} #{zone}"`
end

Then /^the time (in|out) on my timesheet should be (\d{4}(\-\d\d){2} (\d{2}:){2}\d{2} \-\d{4})$/ do |status,date,time,zone|
  File.open("/home/#{@username}/.timesheet/timesheet",'r+') do |file|
    IO.readlines(file)[-1].should =~ /#{status}.*#{date} #{time} #{zone}\n?$/
  end
end

Then /^my username and time (in|out) should be posted to my timesheet$/ do |status|
  # Keep columns the same width for in and out statuses
  if status == "in" then status = "in "; end
  File.open("/home/#{@username}/.timesheet/timesheet",'r+') do |file|
    IO.readlines(file)[-1].should eql "#{@username} #{status} => #{Time.now}\n"
  end
end