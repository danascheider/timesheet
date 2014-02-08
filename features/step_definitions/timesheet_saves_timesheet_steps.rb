require 'log'
require 'etc'

Given /^there is no directory called (.*)$/ do |name|
  File.directory?(name) == nil
end

When /^I clock in$/ do 
  @action = `bundle exec bin/timesheet -u dscheider in -t '2014-02-07 17:27:00 -0800'`
end

Then /^a directory called (.*) should be created$/ do |directory|
  File.exist?(directory)
end

And /^the time should be logged in a file called (.*)$/ do |file|
  raise("Error: No such file") unless File.exists?(file)
  @arr = IO.readlines(file)
  @arr[-1].should == "dscheider in  => 2014-02-07 17:27:00 -0800"
  # The file ~/.timesheet/timesheet should exist and the last line should be 
  # dscheider in  => 2014-02-07 17:27:00 -0800
end