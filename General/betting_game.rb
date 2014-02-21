#!usr/bin/env ruby

require_relative "../Cards/Game"

class BettingGame < Game
  attr_accessor :pots
  
  def initialize
    super

    @pots = new Pot(0)
  end
end
