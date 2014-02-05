Given /^there is no directory called "^\S*\/\.?\w+\/?"$/ do |name|
  File.directory?(name) == nil
end

When /^I clock in$/ do 
  @shift = Shift.new
  @shift.in
end

Then /^A directory called "^\S*\/\.?\w+\/?" should be created$/ do |name|
  Dir.mkdir(name)
end