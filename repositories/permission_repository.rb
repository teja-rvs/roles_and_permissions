require_relative 'repository'

class PermissionRepository < Repository
  def initialize
    super(klass: self)
    @permissions = []
  end

  def all
    @permissions
  end
end