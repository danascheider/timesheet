Given /^there is no directory called "\.?\w+"$/ do 
  File.directory?("~/.timesheet")
end

When /^I clock in$/ do 
  @shift = Shift.new
  @shift.in
end

Then /^A directory called ~\/\.timesheet should be created$/ do 
  #
end