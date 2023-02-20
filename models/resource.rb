require_relative '../repositories/resource_repository'

class Resource

  REPOSITORY = ResourceRepository.new

  attr_accessor :id, :name, :service_id

  def initialize(name:, service:)
    @name       = name
    @service_id = service.id
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end

  def self.find_by_name(name:)
    REPOSITORY.find_by_name(name: name)
  end
end