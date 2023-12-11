class Player
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = 3
  end

  def remove_point
    @score -= 1
  end

  def did_lose?
    @score <= 0
  end

end 