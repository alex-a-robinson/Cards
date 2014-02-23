#!usr/bin/env ruby

require_relative "../Cards/Dealer"
require_relative "black_jack_player"
require_relative "black_jack_hand"

class BlackJackDealer < Dealer
  
  def hit(player)
    card = @deck.take
    player.take_cards(card)
    return card
  end
  
  def deal(players)
    players.each do |player|
      player.hand = deal_hand
    end
  end
  
  def deal_hand
    warn "Too few cards" if @deck.size < 2
    cards = @deck.take(2)
    BlackJackHand.new(cards)
  end
  
  def hit?
    if (@hand.score < 17) || (@hand.score <= 17 && @hand.soft?)
      true
    else
      false
    end
  end
end
