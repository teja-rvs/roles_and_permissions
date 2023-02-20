require_relative 'repository'

class ResourceMethodRepository < Repository

  def initialize
    super(klass: self)
    @resource_methods = []
  end

  def all
    @resource_methods
  end

  def find_method(resource_id:, name:)
    all.select do |resource_method|
      resource_method.resource_id == resource_id && name == resource_method.name
    end
  end

end