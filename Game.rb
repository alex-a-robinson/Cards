#!usr/bin/env ruby

class Game
  def initialize
    @name = "The name of the Game"
    @rules = "The games rules"
    @players = []
  end
  
  def add_player(player)
    @players.push(player)
  end
  
  def print_rules
    puts @rules
  end
end