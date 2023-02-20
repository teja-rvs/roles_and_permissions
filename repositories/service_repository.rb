require_relative 'repository'

class ServiceRepository < Repository
  def initialize
    super(klass: self)
    @services = []
  end

  def all
    @services
  end
end