#!usr/bin/env ruby

require_relative "../General/betting_game"
require_relative "../General/UI"

class BlackJackGame < BettingGame
  def initialize(dealer)
    super()

    @name = "Black Jack"
    @dealer = dealer
    @players = []
    @rules = <<-RULES
      Each player is given two cards to start. A player can decide
      to either Stick (Keep the cards they have) or Hit (Take another
      card from the deck). The aim is get as close to 21 without going
      over.
    RULES
  end

  def winners
    # FIXME: If two players have the same score only shows one
    max = @players.max_by do |player|
      player.hand.cards.size
    end

    return Array(max) if max.hand.cards.size >= 5

    max = @players.max_by do |player|
      player.score
    end
    max = Array(max)
    return !(max[0].score == -1) ? max : []
  end

  def show_winners
    puts winners.size > 0 ? "The winner is: " : "Nobody won."
    winners.each do |player|
      puts "#{player.name} who scored #{player.score}"
    end
  end

  def show_title
    puts @name
    horizontal_bar_big(15)
  end

  def betting_round
    @players.each do |player|
      puts player.info_with_name
      @pots[player].value += player.bet
    end
  end

  def give_winners_pot
    amount = split_pot(winners.size)
    winners.each do |player|
      player.add_cash(amount)
      puts "#{player.name} got $#{amount} and now has #{player.cash}"
    end
  end

  def turn_of(player)
    horizontal_bar(15)
    puts player.info_with_name
    
    case player.action
    when "stand"
      # 
    when "hit"
      
    when "double"
      #
    when "split"
      #
    when "surrender"
      #
    
    while player.action == "hit"
      @dealer.hit(player)
      puts player.info
    end
  end
  
  def play_round
    @players.each do |player|
      turn_of(player)
    end
  end
  
  def reval
    horizontal_bar_big(15)
    show_winners
    give_winners_pot
  end

  def play
    show_title

    @dealer.shuffle_deck
    @dealer.deal(@players)

    betting_round
    play_round
    betting_round
    reval
  end
end
