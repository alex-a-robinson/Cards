#!usr/bin/env ruby

require_relative "../Cards/Dealer"

class BlackJackDealer < Dealer
  def hit(player)
    card = @deck.take
    player.take_cards(card)
    return card
  end
  
  def deal(players)
    players.each do |player|
      player.hand = deal_hand(2)
    end
  end
end
