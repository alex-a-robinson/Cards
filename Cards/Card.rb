#!usr/bin/env ruby

class Card
  attr_accessor :value
  attr_reader :value_name
  attr_reader :suit
  attr_reader :suit_name


  def initialize(value, value_name, suit, suit_name)
    @value = value
    @value_name = value_name
    @suit = suit
    @suit_name = suit_name
  end

  def name
    "#{@value_name}#{@suit_name}"
  end
end
