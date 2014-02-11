require_relative 'user'

class Log 

  attr_reader :username
  attr_reader :file 
  attr_reader :dir

  def initialize(user=User.new)
    @user = user
    @username = user.name
    @dir = if File.exist?(dirname="/home/#{username}/.timesheet/") then dirname;
    else Dir.mkdir(dirname); end
    @file = if File.exists?("#{dirname}timesheet") then "#{dirname}timesheet";
    else File.open(("#{dirname}timesheet"), "a+") { |file| file.write("TIMESHEET FOR #{@username.upcase}\n") }; end
  end

  def in(time=Time.now)
    @file.puts "#{@username} in  => #{time}"
  end

  def out(time=Time.now)
    @file.puts "#{@username} out => #{time}"
  end
end