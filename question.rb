class Question
  attr_reader :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end

  def create_question
    "What is #{@num1} + #{@num2}?"
  end

  def correct_answer?(current_answer)
    current_answer.to_i == @answer
  end

end