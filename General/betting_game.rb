#!usr/bin/env ruby

require_relative "../Cards/Game"
require_relative "pot"

class BettingGame < Game
  attr_accessor :pots
  
  def initialize
    super

    @pots = {}
  end
end
