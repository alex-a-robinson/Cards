#!usr/bin/env ruby

require_relative '../General/standard_deck'

class BlackJackDeck < Deck
  def initialize
    @cards = []
    add_decks
    edit_values
  end
  
  def add_decks(number_of_decks=4)
    number_of_decks.times do |i|
      deck = StandardDeck.new
      add_cards(deck.cards)
    end
  end
  
  def edit_values
    @cards.each do |card|
      card.value = 10 if card.value > 10
    end
  end
end
