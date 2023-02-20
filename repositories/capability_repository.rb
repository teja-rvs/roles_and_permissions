require_relative 'repository'

class CapabilityRepository < Repository
  def initialize
    super(klass: self)
    @capabilities = []
  end

  def all
    @capabilities
  end
end