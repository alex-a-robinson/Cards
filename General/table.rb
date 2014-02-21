#!usr/bin/env ruby

class Table
  attr_writer :game
  attr_accessor :players
  
  def initialize
    @game
    @players = []
  end
end