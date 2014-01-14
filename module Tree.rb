module Tree
  @age
  def age!
    @age+=1
  end

  def age_faster!
    @age*=2
  end
end

class OrangeTree
  include Tree
  attr_reader :age
  def initialize
    @age = 0
  end
end

tree = OrangeTree.new
tree.age!
tree.age!
p tree.age
tree.age_faster!
p tree.age