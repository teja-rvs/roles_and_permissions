require_relative 'repository'

class RoleRepository < Repository
  def initialize
    super(klass: self)
    @roles = []
  end

  def all
    @roles
  end
end