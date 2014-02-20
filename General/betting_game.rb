#!usr/bin/env ruby

require_relative "../Cards/Game"

class BettingGame < Game
  def initialize
    super
    
    @pot = 0.0
  end
  
  def add_to_pot(amount)
    @pot += amount
  end
  
  def take_pot
    amount = @pot
    @pot = 0.0
    return amount
  end
  
  def split_pot(number_of_players)
    amount = @pot / number_of_players
    @pot = 0.0
    return amount.round(2)
  end
end