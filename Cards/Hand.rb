#!usr/bin/env ruby

require_relative "Deck"

class Hand < Deck
  def show_hidden
    s = ""
    @cards.each do |card|
      s << (card.visible ? "* " : card.show)
    end
    return s
  end
  
  def visible_cards
    cards = []
    @cards.each do |card|
      cards.push(card) if card.visible?
    end
    return cards
  end
end
