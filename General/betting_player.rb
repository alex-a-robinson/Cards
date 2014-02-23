#!usr/bin/env ruby

require_relative "../Cards/Player"
require_relative "bet"

class BettingPlayer < Player
  attr_accessor :cash
  
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
    return Bet.new(amount)
  end

  def show_cash
    "$%.2f" % @cash
  end
end
