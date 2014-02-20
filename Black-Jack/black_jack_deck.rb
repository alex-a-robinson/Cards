#!usr/bin/env ruby

require_relative '../General/standard_deck'

class BlackJackDeck < StandardDeck
  def initialize
    super

    @cards.each do |card|
      card.set_value(10) if card.value > 10
    end
  end
end