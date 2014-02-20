#!usr/bin/env ruby

class Card
  def initialize(value, value_name, suit, suit_name)
    @value = value
    @value_name = value_name
    @suit = suit
    @suit_name = suit_name
  end
  
  def value
    @value
  end
  
  def suit
    @suit
  end
  
  def name
    "#{@value_name}#{@suit_name}"
  end
end