class Question

  def initialize
    @num_one = rand(0..21)
    @num_two = rand(0..21)
    @operator = generate_operator 
    @question = "What is #{@num_one} #{@operator} #{@num_two}?"
  end

  def ask
    puts @question
  end

  def generate_operator
    operators = ["+", "-", "*", "/"]
    operators.sample
  end

  def answer
    eval "#{@num_one}#{@operator}#{@num_two}"
  end 
    
end



