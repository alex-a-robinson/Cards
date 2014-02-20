#!usr/bin/env ruby

require_relative "../Cards/Player"

class BettingPlayer < Player
  def initialize(name, cash)
    super(name)

    @cash = cash
  end
  
  def add_cash(amount)
    @cash += amount
  end
  
  def take_cash(amount)
    @cash -= amount
  end
  
  def get_bet
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
    amount = get_bet
    take_cash(amount)
    return amount
  end
  
  def cash
    "$#{@cash}"
  end
end