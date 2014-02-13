# There is an instance of the User class for each user.

require 'etc'
require_relative 'log'

class User
  attr_reader :name
  attr_accessor :status

  def initialize(username=Etc.getlogin,status='out')
    @name = username
    @status = status
  end

  def adopt(file)
    # raise some error if user doesn't have the right permissions
    @log_file = file
  end

  def mklog(username=@name,log_path=nil)
    @log_path = log_path || "/home/#{username}/.timesheet"
    File.exist? @log_path || Dir.mkdir(@log_path)
    if File.exists?(@log_file = "#{@log_path}/timesheet") 
      adopt(@log_file);
    else 
      Log.open(@log_file,"a+") do |file|
        file.puts "TIMESHEET FOR #{@name.upcase}"
      end
    end
  end

  def in(quiet=nil)
    @status = 'in'
    post('in') unless quiet
  end

  def in?
    @status == 'in'
  end

  def out(quiet=nil)
    @status = 'out'
    post('out') unless quiet
  end

  def post(in_or_out,time=Time.now)
    raise ArgumentError("Invalid status #{in_or_out}") unless in_or_out == ('in' || 'out')
    mklog unless @log_file
    @log_file.puts("#{@name} #{in_or_out} => #{time}")
  end
end