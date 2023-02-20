require_relative '../repositories/article_respository'
require_relative '../policies/article_policy'

class Article

  REPOSITORY  = ArticleRepository.new
  POLICY      = ArticlePolicy

  attr_accessor :id, :title, :content, :author_id

  def initialize(title:, content:, author:)
    @title      = title
    @content    = content
    @author_id  = author.id
  end

  def create
    puts POLICY.new(user: author_id).create?
    REPOSITORY.add(self)
  end

  def self.all
    REPOSITORY.all
  end
end