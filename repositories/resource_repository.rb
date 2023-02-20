# frozen_string_literal: true

require_relative 'repository'

class ResourceRepository < Repository
  def initialize
    super(klass: self)
    @resources = []
  end

  def all
    @resources
  end

  def find_by_name(name:)
    all.select { |resource| resource.name == name }
  end
end
