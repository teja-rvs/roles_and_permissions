require_relative '../repositories/user_relationship_repository'

class UserRelationship

  REPOSITORY = UserRelationshipRepository.new

  attr_accessor :id, :parent_user_id, :child_user_id, :relationship_type_id

  def initialize(parent:, child:, relationship_type:)
    @parent_user_id       = parent.id
    @child_user_id        = child.id
    @relationship_type_id = relationship_type.id
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end
end