#!usr/bin/env ruby

require "./Dealer"

class BlackJackDealer < Dealer
  def hit(player)
    card = @deck.take
    player.add_cards(card)
    return card
  end
end