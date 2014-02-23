#!usr/bin/env ruby

class Card
  attr_accessor :value
  attr_reader :value_name
  attr_reader :suit
  attr_reader :suit_name
  attr_accessor :visible


  def initialize(value, value_name, suit, suit_name)
    @value = value
    @value_name = value_name
    @suit = suit
    @suit_name = suit_name
    @visible = false
  end

  def name
    "#{@value_name}#{@suit_name}"
  end
  
  def face_up?
    @visible
  end
  
  def turn_over
    @visible = @visible ? false : true
  end
  
  def show
    "#{@value_name}#{@suit_name}"
  end
  
  def ace?
    @value_name == "A" ? true : false
  end

  def visible?
    @visible
  end
end
