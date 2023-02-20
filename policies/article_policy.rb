class ArticlePolicy < Policy

  RESOURCE = Article

  def create?
    roles.each do |role|
      Permission.access?(role_id: role.id, resource_id: @resource_id, method_id: method_id('create'))
    end
  end

  def resource_id
    @resource_id ||= Resource.find_by_name(name: RESOURCE)
  end

  def method_id(name)
    ResourceMethod.find_method(resource_id: @resource_id, name: name)
  end

end