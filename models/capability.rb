require_relative '../repositories/capability_repository'

class Capability

  REPOSITORY = CapabilityRepository.new

  attr_accessor :id, :user_id, :resource_id, :object_id

  def initialize(user:, resource:, object:)
    @user_id      = user.id
    @resource_id  = resource.id
    @object_id    = object.id
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end
end