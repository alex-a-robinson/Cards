#!usr/bin/env ruby

class Player
  attr_accessor :hand
  attr_reader :name
  
  def initialize(name)
    @name = name
    @hand = nil
  end

  def take_cards(cards)
    puts "Player does not have a hand" if @hand == nil
    @hand.add_cards(cards)
  end

  def show_hand
    "#{@hand.show}"
  end

  def say_name
    puts @name
  end
end
