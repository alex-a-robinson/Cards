#!usr/bin/env ruby

class Deck
  def initialize(cards = [])
    @cards = cards
  end
  
  def cards
    @cards
  end
  
  def add_cards(cards)
    cards.each do |card|
      @cards.push(card)  
    end
  end
  
  def take(number_of_cards = 1)
    @cards.slice!(0, number_of_cards)
  end
  
  def show
    str = ""
    @cards.each do |card|
      str.concat(card.name + " ")
    end
    return str
  end
  
  def size
    @cards.size
  end
  
  def shuffle
    @cards.shuffle!
  end
end