# frozen_string_literal: true

require_relative './models/user'
require_relative './models/role'
require_relative './models/user_role'
require_relative './models/user_relationship_type'
require_relative './models/user_relationship'
require_relative './models/article'
require_relative './models/service'
require_relative './models/resource'
require_relative './models/resource_method'
require_relative './models/permission'

team_lead = User.new(name: 'tl', email: 'tl@user.com', password: 'apple@123')
team_lead.create

team_member = User.new(name: 'tl', email: 'tl@user.com', password: 'apple@123')
team_member.create

puts User.all.inspect

team_lead_role = Role.new('Team Lead')
team_lead_role.create

team_member_role = Role.new('Team Member')
team_member_role.create

puts Role.all.inspect

team_lead_role_assignment = UserRole.new(user: team_lead, role: team_lead_role)
team_lead_role_assignment.create

team_member_role_assignment = UserRole.new(user: team_member, role: team_member_role)
team_member_role_assignment.create

puts UserRole.all.inspect

team_lead_team_member_relation_type = UserRelationshipType.new(
  name: 'team_leader_team_member',
  parent: team_lead_role,
  child: team_member_role
)
team_lead_team_member_relation_type.create

puts UserRelationshipType.all.inspect

user_relationship = UserRelationship.new(
  parent: team_lead,
  child: team_member,
  relationship_type: team_lead_team_member_relation_type
)

user_relationship.create

puts UserRelationship.all.inspect

service = Service.new('Blog')
service.create
puts Service.all.inspect

article_resource = Resource.new(name: 'Article', service: service)
article_resource.create
puts Resource.all.inspect

resource_method = ResourceMethod.new(name: 'create', resource: article_resource)
resource_method.create
puts ResourceMethod.all.inspect

article_permission = Permission.new(
  role: team_member,
  resource: article_resource,
  method: resource_method,
  access: true
)
article_permission.create
puts Permission.all.inspect

article = Article.new(title: 'Test One', content: 'This is a sample article', author: team_member)
article.create
puts Article.all.inspect
