require_relative 'game'

puts "Let's start a new math game!"

puts "Player 1, what is your name?"

player1_name = gets.chomp

puts "Player 2, what is your name?"

player2_name = gets.chomp

game = Game.new(player1_name, player2_name)
game.play_game