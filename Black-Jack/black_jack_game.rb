#!usr/bin/env ruby

require_relative "../General/betting_game"
require_relative "../General/UI"
require_relative "../General/house"

class BlackJackGame < BettingGame
  def initialize(dealer)
    super()

    @name = "Black Jack"
    @dealer = dealer
    @players = []
    @pots = {}
    @rules = <<-RULES
      Each player is given two cards to start. A player can decide
      to either Stick (Keep the cards they have) or Hit (Take another
      card from the deck). The aim is get as close to 21 without going
      over.
    RULES
  end

  def show_title
    puts @name
    horizontal_bar_big(15)
  end

  def betting_round
    @players.each do |player|
      puts player.info_with_name
      if @pots.key?(player)
        @pots[player].value += (player.bet).value
      else
        @pots[player] = player.bet
      end
    end
  end

  def give_winners_pot
    amount = split_pot(winners.size)
    winners.each do |player|
      player.add_cash(amount)
      puts "#{player.name} got $#{amount} and now has #{player.show_cash}"
    end
  end

  def turn_of(player)
    horizontal_bar(15)
    puts player.info_with_name
    
    action = player.action
    
    puts action
    
    case action
    when "stand"
      # Do nothing
    when "hit"
      loop do
        @dealer.hit(player)
        puts player.info
        break if !player.hit? || player.bust?
      end
    when "double"
      amount = @pots[player].value
      if player.cash >= amount
        @pots[player].value += amount
      else
        # REVIEW: Player should be able to rechoose what to do
        puts "You don't have enough cash (need $#{amount} have #{player.show_cash})."
      end
      @dealer.hit(player)
      puts player.info
    when "split"
      #
    when "surrender"
      amount = @pots[player].value
      player.cash += amount / 2.0
      # house.cash += amount / 2
      @pots.delete(player)
      @players.delete(player)
      puts "Surrendered, recived $#{amount / 2.0} back of $#{amount} bet"
    end
  end
  
  def turn_of_dealer
    puts "Dealer Hand: #{@dealer.hand.show} (#{@dealer.hand.rank})"
    while @dealer.hit?
      sleep(1)
      @dealer.hit(@dealer)
      puts "Dealer Hit (Hand: #{@dealer.hand.show} [#{@dealer.hand.rank}])"
    end
  end
  
  def play_round
    @players.each do |player|
      turn_of(player)
    end
    turn_of_dealer
  end
  
  def push(player)
    amount = @pots[player].value
    @pots.delete(player)
    player.cash += amount
    puts "Push - recived $#{amount}"
  end
  
  def blackjack_payout(player)
    bet_value = @pots[player].value
    player.cash += bet_value
    player.cash += bet_value * 3.0/2.0
    @pots.delete(player)
    puts "Blackjack - recived $#{amount}"
  end
  
  def payout(player)
    amount = @pots[player].value
    @pots.delete(player)
    player.cash += amount
    puts "Won - recived $#{amount}"
  end
  
  def reval
    horizontal_bar_big(15)
    @players.each do |player|
      if player.hand.rank == @dealer.hand.rank
        push(player)
      elsif player.hand.rank == "blackjack"
        blackjack_payout(player)
      elsif player.hand.rank != "bust" && (@dealer.hand.rank == "bust" || player.hand.rank >= @dealer.hand.rank)
        payout(player)
      else
        # REVIEW: House should really take the money
        puts "You lost $#{@pots[player].value} (You: #{player.hand.rank}, Dealer: #{@dealer.hand.rank})"
        @pots.delete(player)
      end
    end
  end

  def play
    show_title
    
    # REVIEW: The deck is not actually shuffled in black jack, cards are re used in same order 
    @dealer.shuffle_deck
    
    betting_round
    @dealer.deal(@players + [@dealer])
    
    if @dealer.hand.rank == "blackjack"
      # Insurence bet
    end
    
    betting_round
    play_round
    reval
  end
end
