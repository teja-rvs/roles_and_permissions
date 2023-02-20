# frozen_string_literal: true

require_relative '../repositories/permission_repository'

class Permission
  REPOSITORY = PermissionRepository.new

  attr_accessor :id, :role_id, :resource_id, :method_id, :access

  def initialize(role:, resource:, method:, access:)
    @role_id      = role.id
    @resource_id  = resource.id
    @method_id    = method.id
    @access       = access || false
  end

  def create
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end

  def self.access?(role_id:, resource_id:, method_id:)
    all.select do |permission|
      permission.role_id = role_id && permission.resource_id == resource_id && permission.method_id == method_id
    end.map(&:access).include?(true)
  end
end
