# There is an instance of the User class for each user.

require 'etc'

class User
  attr_reader :name
  attr_accessor :status

  def initialize(username=Etc.getlogin,status='out')
    @name = username
    @status = status
  end

  def in
    @status = 'in'
  end

  def in?
    @status == 'in'
  end

  def out
    @status = 'out'
  end
end