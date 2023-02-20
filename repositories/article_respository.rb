require_relative 'repository'

class ArticleRepository < Repository

  def initialize
    super(klass: self)
    @articles = []
  end

  def all
    @articles
  end
end