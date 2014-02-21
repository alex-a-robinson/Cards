#!usr/bin/env ruby

require_relative "../Cards/Deck"
require_relative "../Cards/Card"

class StandardDeck < Deck  
  def initialize
    card_values = (1..12).to_a
    card_value_names =
      { 1 => "A", 2 => 2, 3 => 3, 4 => 4,
       5 => 5, 6 => 6, 7 => 7, 8 => 8,
       9 => 9, 10 => "J", 11 => "Q", 12 => "K" }

      card_suits = ["S", "H", "D", "C"]
      card_suit_names = { "S" => "♠", "H" => "♥",
                   "D" => "♦", "C" => "♣" }

    @cards = []
    card_suits.each do |suit|
      card_values.each do |value|
        suit_name = card_suit_names[suit]
        value_name = card_value_names[value]

        card = Card.new(value, value_name,
                        suit, suit_name)

        @cards.push(card)
      end
    end
  end
end
