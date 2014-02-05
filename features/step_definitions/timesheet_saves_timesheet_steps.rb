Given /^there is no directory called "\S*\/\.?\w+\/?"$/ do |name|
  File.directory?(name) == nil
end

When /^I clock in$/ do 
  @shift = Shift.new
  @shift.in
end

Then /^a directory called "\S*\/\.?\w+\/?" should be created$/ do |name|
  Dir.mkdir(name)
end

And /^the time should be logged in a file called "\S*\/\.?\w+\/\S+"$/ do |name|
  File.open(name, "r+") do |file|
    file.puts(@shift.time_in)
  end
end