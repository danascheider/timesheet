require 'log'
require 'etc'

Given "there is no directory called $name" do |name|
  File.directory?(name) == nil
end

When /^I clock in$/ do 
  @timesheet = Log.new
  @timesheet.in
end

Then "a directory called $directory should be created" do |directory|
  Dir.mkdir(name)
end

And /^the time should be logged in a file called "\S*\/\.?\w+\/\S+"$/ do |name|
  File.open(name, "r+") do |file|
    file.puts(@timesheet.time_in)
  end
end