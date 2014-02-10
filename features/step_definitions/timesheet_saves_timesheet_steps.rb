require 'log'
require 'etc'

Given /^there is (a|no) directory called (.*)$/ do |article,dirname|
  if article == "a" then File.directory?(dirname);
  else !File.directory?(dirname)
end

When /^I clock in$/ do 
  @action = `bundle exec bin/timesheet -u dscheider in -t '2014-02-07 17:27:00 -0800'`
end

Then /^a directory called (.*) should be created$/ do |directory|
  File.exist?(directory)
end

And /^a file called (.*) should be created$/ do |file|
  pending("How to simulate file (or directory) being created?")
end

And /^the time should be appended to the file (.*)$/ do |file|
  raise("Error: No such file") unless File.exists?(file)
  @arr = IO.readlines(file)
  @arr[-1].should == "dscheider in  => 2014-02-07 17:27:00 -0800"
end

But /^there is no file called (.*)$/ do |name|
  File.exists?(name) == nil
end