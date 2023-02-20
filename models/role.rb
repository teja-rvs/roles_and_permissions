# frozen_string_literal: true

require_relative '../repositories/role_reposioty'

class Role
  REPOSITORY = RoleRepository.new

  attr_accessor :id, :name, :code

  def initialize(name)
    @name = name
    @code = create_code
  end

  def self.find(id)
    REPOSITORY.find(id)
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end

  def self.where(ids)
    REPOSITORY.where(ids)
  end

  private

  def create_code
    snake_case(name)
  end

  def snake_case(text)
    text.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .gsub(/\s/, '_')
      .gsub(/__+/, '_')
      .downcase
  end
end
