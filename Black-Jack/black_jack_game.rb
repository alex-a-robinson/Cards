#!usr/bin/env ruby

require_relative "../Cards/Game"
require_relative "../General/UI"

class BlackJackGame < Game
  def initialize(dealer)
    super 
    
    @name = "Black Jack"
    @dealer = dealer
    @rules = <<-RULES
      Each player is given two cards to start. A player can decide
      to either Stick (Keep the cards they have) or Hit (Take another
      card from the deck). The aim is get as close to 21 without going
      over.
    RULES
  end
  
  def winner
    # FIXME: If two players have the same score only shows one
    max = @players.max_by do |player|
      player.result
    end
    max = Array(max)
    return !(max[0].result == -1) ? max : []
  end
  
  def show_winners
    puts winner.size > 0 ? "The winner is: " : "Nobody won."
    winner.each do |player|
      puts "#{player.name} who scored #{player.result}"
    end
  end
  
  def show_title
    puts @name
    horizontal_bar_big(15)
  end
  
  def play
    
    show_title
  
    @dealer.shuffle_deck
    @players.each do |player|
      hand = @dealer.deal_hand(2)
      player.take_hand(hand)
    end
    
    @players.each do |player|
      horizontal_bar(15)
      puts "#{player.name}:"
      player.show_hand
      player.show_state
      while player.decide_to == "hit"
        @dealer.hit(player)
        player.show_hand
        player.show_state
      end
    end
    horizontal_bar_big(15)
    show_winners
  end
end