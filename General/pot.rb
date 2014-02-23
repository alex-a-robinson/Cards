#!usr/bin/env ruby

require_relative "bet"

class Pot < Bet
  def add_bet(bet)
    value += bet.value
  end
  
  def split(players)
    amount_each = @value / players.size
    players.each do |player|
      player.cash += amount_each
    end
  end
  
  def pay_out
    amount = @value
    @value = 0
    return amount
  end
  
  def show_value
    "$#{@value}"
  end
end