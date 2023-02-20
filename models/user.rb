# frozen_string_literal: true

require_relative '../repositories/user_repository'
require_relative 'user_role'
require_relative 'role'

# contains details about the stake holders
class User
  REPOSITORY = UserRepository.new

  attr_accessor :id, :name, :email, :password

  def initialize(name:, email:, password:)
    @name     = name
    @email    = email
    @password = password
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end

  def roles
    ids = UserRole.filter_by_user(self).map(&:role_id)
    Role.where(ids)
  end

  def self.find(id)
    REPOSITORY.find(id)
  end
end
