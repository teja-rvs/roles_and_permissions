class UserRelationshipTypeRepository < Repository
  def initialize
    super(klass: self)
    @user_relationship_types = []
  end

  def all
    @user_relationship_types
  end
end