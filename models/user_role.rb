require_relative '../repositories/user_role_repository'

class UserRole

  REPOSITORY = UserRoleRepository.new

  attr_accessor :id, :user_id, :role_id

  def initialize(user:, role:)
    @user_id = user.id
    @role_id = role.id
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end

  def self.filter_by_user(user)
    all.select { |user_role| user_role.user_id == user.id }
  end

  def self.filter_by_role(role)
    all.select { |user_role| user_role.role_id == role.id }
  end
end