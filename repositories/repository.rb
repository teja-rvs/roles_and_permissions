class Repository
  attr_accessor :klass

  def initialize(klass:)
    @klass = klass
  end

  def add(object)
    object.id = all.size + 1
    all << object
  end

  def find(id)
    all.find { |object| object.id == id }
  end

  def where(ids)
    all.select { |object| ids.include? object.id }
  end

  def all
    klass.all
  end

  def update(object)
    exising_object = find(object.id)
    exising_object = object
  end

  def delete(id)
    all.delete_if { |user| user.id == id }
  end
end