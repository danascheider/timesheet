require 'etc'

class Log 

  def initialize(user=Etc.getlogin)
    @user = user
    @dir = Dir.mkdir(dirname="/home/#{user}/.timesheet/")
    @file = File.open((dirname + "timesheet"), "a+")
    @file.puts "TIMESHEET FOR #{@user.upcase}" if File.zero?(@file)
  end

  def in(time=Time.now)
    @file.puts "#{@user} in  => #{time}"
  end

  def out(time=Time.now)
    @file.puts "#{@user} out => #{time}"
  end
end