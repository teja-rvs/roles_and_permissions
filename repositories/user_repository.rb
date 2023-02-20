require_relative 'repository'

class UserRepository < Repository
  def initialize
    super(klass: self)
    @users = []
  end

  def all
    @users
  end

end