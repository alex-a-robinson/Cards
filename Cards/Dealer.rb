#!usr/bin/env ruby

require_relative "Player"
require_relative "Hand"

class Dealer < Player
  def initialize(deck, name)
    super
    
    @deck = deck
  end
  
  def shuffle_deck
    @deck.shuffle
  end
  
  def deal_hand(number_of_cards)
    warn "Too few cards" if @deck.size < number_of_cards
    cards = @deck.take(number_of_cards)
    Hand.new(cards)
  end
end