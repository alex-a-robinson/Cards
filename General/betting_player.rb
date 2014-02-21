#!usr/bin/env ruby

require_relative "../Cards/Player"
require_relative "bet"

class BettingPlayer < Player
  def initialize(name, cash)
    super(name)

    @cash = cash
  end

  def add_cash(amount)
    @cash += amount
  end

  def ask_bet
    amount = 0
    print "Bet:"
    amount = gets.chomp.to_f
    while amount > @cash
      print "Don't have enough cash (have #{cash}),\ntry again:"
      amount = gets.chomp.to_f
    end
    return amount
  end

  def bet
    amount = ask_bet
    @cash -= amount
    bet = new Bet(amount)
    return bet
  end

  def cash
    "$%.2f" % @cash
  end
end
