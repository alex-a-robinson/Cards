#!usr/bin/env ruby

require_relative "../General/table"

class BlackJackTable < Table
  attr_accessor :bets
  attr_reader :dealer
  
  def initialize(dealer)
    super
    
    @bets = {} # player => bet
    @dealer = dealer
    # @min_bet = 5
    # @max_bet = 200
    # @max_payout = 2000
  end
end