require_relative '../repositories/user_relationship_type_repository'

class UserRelationshipType

  REPOSITORY = UserRelationshipTypeRepository.new

  attr_accessor :id, :name, :parent_role, :child_role

  def initialize(name:, parent:, child:)
    @name         = name
    @parent_role  = parent.id
    @child_role   = child.id
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end
end