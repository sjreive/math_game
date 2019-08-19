class Player
  attr_accessor :lives 
  attr_reader :name

  def initialize name
    @name = name
    @lives = 3
  end

  def alive? 
    if @lives > 0
      true
    else
      false
    end
  end

end







