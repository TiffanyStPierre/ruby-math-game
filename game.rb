require_relative 'player'
require_relative 'question'

class Game

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1
    @current_question = Question.new
  end

  def next_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def game_over?
    @player1.did_lose? || @player2.did_lose?
  end

  def game_winner
    @player1.did_lose? ? @player2.name : @player1.name
  end

  def play_game

    until game_over?
    
      puts "#{@current_player.name} you're up!"

      @current_question = Question.new  
      puts @current_question.create_question
      current_answer = gets.chomp

      if @current_question.correct_answer?(current_answer)
        puts "That's correct!"
        puts "The current score is #{@player1.name}: #{@player1.score} and #{@player2.name}: #{@player2.score}"
      else puts "That is not the correct answer. You lose a point."
        @current_player.remove_point
        puts "The current score is #{@player1.name}: #{@player1.score} and #{@player2.name}: #{@player2.score}"
      end

      next_player
    end

    puts "#{game_winner} has won the game!"

  end
end