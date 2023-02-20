require_relative '../models//user'

class Policy
  attr_accessor :current_user_id

  def initialize(user_id)
    @current_user_id = user.id
  end

  def current_user
    User.find(current_user_id)
  end

  def roles
    current_user.roles
  end
end