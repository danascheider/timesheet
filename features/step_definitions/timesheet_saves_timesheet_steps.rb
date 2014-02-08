require 'log'
require 'etc'

Given /^there is no directory called (.*)$/ do |name|
  File.directory?(name) == nil
end

When /^I clock in$/ do 
  @action = `bundle exec bin/timesheet in`
end

Then /^a directory called (.*) should be created$/ do |directory|
  File.exist?(directory)
end

And /^the time should be logged in a file called "\S*\/\.?\w+\/\S+"$/ do |name|
  File.open(name, "r+") do |file|
    file.puts(@timesheet.time_in)
  end
end