require_relative '../repositories/resource_method_repository'

class ResourceMethod

  REPOSITORY = ResourceMethodRepository.new

  attr_accessor :id, :resource_id, :name

  def initialize(name: , resource:)
    @name         = name
    @resource_id  = resource.id
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end

  def find_method(resource_id:, name:)
    REPOSITORY.find_method(resource_id: resource_id, name: name)
  end
end