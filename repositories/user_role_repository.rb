require_relative 'repository'

class UserRoleRepository < Repository
  def initialize
    super(klass: self)
    @user_roles = []
  end

  def all
    @user_roles
  end
end