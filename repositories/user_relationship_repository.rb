class UserRelationshipRepository < Repository
  def initialize
    super(klass: self)
    @user_relationships = []
  end

  def all
    @user_relationships
  end


end