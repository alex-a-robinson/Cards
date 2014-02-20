#!usr/bin/env ruby

require "./Deck"
require "./Card"

CARD_VALUES = (1..12).to_a

CARD_VALUE_NAMES = 
  {1 => "A", 2 => 1, 3 => 3, 4 => 4,
   5 => 5, 6 => 6, 7 => 7, 8 => 8,
   9 => 9, 10 => "J", 11 => "Q", 12 => "K"}
       
CARD_SUITS = ["S", "H", "D", "C"]
CARD_SUIT_NAMES = {"S" => "♠", "H" => "♥", 
                   "D" => "♦", "C" => "♣"}


class StandardDeck < Deck
  def initialize
    @cards = []
    CARD_SUITS.each do |suit|
      CARD_VALUES.each do |value|
        suit_name = CARD_SUIT_NAMES[suit]
        value_name = CARD_VALUE_NAMES[value]
        
        card = Card.new(value, value_name, 
                 suit, suit_name)
                
        @cards.push(card)
      end
    end
  end
end