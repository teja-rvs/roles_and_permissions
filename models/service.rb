require_relative '../repositories/service_repository'

class Service

  REPOSITORY = ServiceRepository.new

  attr_accessor :id, :name

  def initialize(name)
    @name = name
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end
end