# This is how you define your own custom exception classes
class NoFruitError < StandardError
end

class FruitTree
  attr_reader :age, :height, :dead
  @max_age = 30
  @@growth_rate = 2
  @@crop_size = 12
  @@fruit_bearing_age = 5
  @@peak_age_min = 13
  @@peak_age_max = 23
  @@peak_crop_size = 8
  @@fruit = "fruit"

  def initialize(*args)
    @age = 0
    @height = 0
    @dead = false
    @number_of_fruit = 0
  end

  def self.change_max_age(num)
    @max_age = num
  end

  def self.max_age
    @max_age
  end

  def max_age
    @max_age
  end

  # Ages the tree one year
  def age!
    @age < @max_age ? @age+=1 : @dead = true
    @height+=2 unless @height==20
    grow_fruit
  end

  def dead?
    @dead
  end

  def any_fruit?
    @number_of_fruit > 0
  end

  def pick_a_fruit!
    raise NoFruitError, "You don't have any #{@fruit}!" unless self.any_fruit?
    @number_of_fruit -= 1
    @fruitclass.new
  end

  private

  def grow_fruit
    frost? ? i = 0.75 : i  = 1
    if @age.between?(@@fruit_bearing_age,@@peak_age_min) || @age.between?(@@peak_age_max,@max_age)
      @number_of_fruit+=@@crop_size*i
    elsif @age.between?(13,22)
      @number_of_fruit+=@@peak_crop_size*i
    end
  end

  def frost?
    rand(12) == 1
  end
end

class Fruit
  attr_reader :diameter
  @@max_diameter = 6
  @@chance_of_magic = 1
  @@flavour = "sour"
  @@nutrient = "vitamin C"

  def magic_effect
    if @magic
      puts "Spencer goes wild for you!"
    else
      puts "Just another fruit...rich in #{nutrient}"
    end
  end

end

class OrangeTree < FruitTree
  attr_reader :fruit
  @@fruit = "oranges"
   def initialize (fruitclass = Orange)
    @fruitclass = fruitclass
    super
  end
end

class Orange < Fruit
  def initialize
    @diameter = rand(3..@@max_diameter)
    @magic = rand(@@chance_of_magic) == 0
    magic_effect
  end
end


tree1 = OrangeTree.new(Orange)

# 6.times do tree1.age! end

# p tree1.pick_a_fruit!

p tree1.max_age

OrangeTree.change_max_age(20)

tree2 = OrangeTree.new

p tree2.max_age == tree1.max_age