#!/usr/bin/env ruby

require '../General/standard_deck'

class BlackJackDeck < StandardDeck
  def modifier_values
    super
    
    @deck.each do |card|
      card.set_value(10) if card.value > 10
    end
  end
end