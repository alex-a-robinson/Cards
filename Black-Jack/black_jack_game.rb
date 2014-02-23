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
    @insurence_pots = {}
    @rules = <<-RULES
      Each player is given two cards to start. A player can decide
      to either Stick (Keep the cards they have) or Hit (Take another
      card from the deck). The aim is get as close to 21 without going
      over.
    RULES
  end

  def show_title
    puts @name
    horizontal_bar_big(40)
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
    horizontal_bar(40)
  end
  
  def insurence_bet
    horizontal_bar_big(40)
    puts "Insurence Bet"
    horizontal_bar(40)
    @players.each do |player|
      puts player.info_with_name
      @insurence_pots[player] = player.bet
    end
    horizontal_bar_big(40)
  end

  def turn_of(player)
    horizontal_bar(40)
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
        break if player.bust? || !player.hit?
      end
    when "double"
      amount = @pots[player].value
      if player.cash >= amount
        @pots[player].value += amount
        @dealer.hit(player)
        puts player.info
      else
        # REVIEW: Player should be able to rechoose what to do
        puts "You don't have enough cash (need $#{amount} have #{player.show_cash})."
      end
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
    horizontal_bar_big(40)
    turn_of_dealer
  end
  
  def push(player)
    amount = @pots[player].value
    @pots.delete(player)
    player.cash += amount
    puts "#{player.name} Push - recived $#{amount}"
  end
  
  def blackjack_payout(player)
    bet_value = @pots[player].value
    player.cash += bet_value
    player.cash += bet_value * 3.0/2.0
    @pots.delete(player)
    puts "#{player.name} Blackjack - recived $#{amount}"
  end
  
  def payout(player)
    amount = @pots[player].value
    @pots.delete(player)
    player.cash += amount
    puts "#{player.name} Won - recived $#{amount}"
  end
  
  def reval # resolve_bets
    horizontal_bar_big(40)
    @players.each do |player|
      if player.hand.rank == @dealer.hand.rank
        push(player)
      elsif player.hand.rank == "blackjack"
        blackjack_payout(player)
      elsif player.hand.rank != "bust" && @dealer.hand.rank != "blackjack" && (@dealer.hand.rank == "bust" || player.hand.rank >= @dealer.hand.rank)
        payout(player)
      else
        # REVIEW: House should really take the money
        puts "#{player.name} lost $#{@pots[player].value} (You: #{player.hand.rank}, Dealer: #{@dealer.hand.rank})"
        @pots.delete(player)
      end
      
      # Resolve insurence bets
      if @dealer.hand.rank == "blackjack"
        puts "Insurence bets"
        payout(player)
      end
    end
  end

  def play
    show_title
    
    # REVIEW: The deck is not actually shuffled in black jack, cards are re used in same order 
    @dealer.shuffle_deck
    
    betting_round
    @dealer.deal(@players + [@dealer])
    @dealer.hand.cards[0].turn_over
    puts "Dealers Hand: #{@dealer.hand.show_hidden}"
    
    if @dealer.hand.visible_ace?
      insurence_bet
    end
    
    betting_round
    play_round
    reval
  end
end
