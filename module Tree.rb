class NoFruitError < StandardError
end

module Tree
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
    if @age.between?(@@fruit_bearing_age,@@peak_age_min) || @age.between?(@@peak_age_max,@max_age)
      @number_of_fruit += @@crop_size
    elsif @age.between?(13,22)
      @number_of_fruit += @@peak_crop_size
    end
  end
end
