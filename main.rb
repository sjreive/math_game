#!/usr/bin/ruby

require './player'
require './questions'

class Game

  def initialize 
    @players = [
      Player.new('Player 1'),
      Player.new('Player 2')
    ]
    @round = 1
    @turn = 0
  end

  def play
    # NEED TO DEFINE game_over? function
    while not game_over?
      puts "***** ROUND #{@round} *****"
      puts "It's your turn, Player #{@turn +1} :"
      question = Question.new
      question.ask
      
      # Takes input from player, checks if correct
      answer = gets.chomp.to_i
      
      if answer == question.answer
        puts "You got it!"
      else
        puts "That is WRONG, the answer is #{question.answer}"
        @players[@turn].lives -= 1
      end

      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
      
      # Increments round 
      @round += 1
      
      # switches turns accordingly
      if @turn == 0;
        @turn = 1;
      else
        @turn = 0;
      end

    end
    puts "**** GAME OVER ****"
    puts "The winner is  #{winner.name}!!"
  end

  # FUNCTIONS to define: winner?

  def game_over?
   alive_players = @players.select {|player| player.alive? == true }
    if alive_players.length > 1
      false
    else
      true
    end
  end

  def winner
    winner = @players.select {|player| player.alive? == true}
    winner[0]
  end  

end

new_game = Game.new
new_game.play

