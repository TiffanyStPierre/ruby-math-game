require_relative 'player'
require_relative 'question'

class Game

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1
    @current_question = Question.new
  end

  def next_turn
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def game_over?
    player1.did_lose? || player2.didlose?
  end

  def game_winner
    @player1.did_lose? ? @player2 : @player1
  end

  def play_game

    if game_over?
      puts "#{game_winner} has won the game!"
    else  
    
      puts "#{@current_player.name} you're up!"

      @current_question = Question.new  
      puts current_question.create_question
      current_answer = gets.chomp

      if current_answer = @current_question.correct_answer
        puts "That's correct!"
      else puts "That is not the correct answer. You lose a point"
        @current_player.remove_point

      puts "The current score is #{player1}: #{player1.score} and #{player2}: #{player2.score}"
      end
    end

    next_turn

  end

end