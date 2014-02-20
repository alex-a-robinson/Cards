#!usr/bin/env ruby

require_relative "../General/betting_player"

class BlackJackPlayer < BettingPlayer
  def decide_to_hit?
    if !(state == "bust")
      print "Hit or Stick? :"
      choice = gets.chomp.downcase
      abort("Bye.") if choice == "q" || choice == "quit"
      return (choice == "hit" || choice == "h") ? true : false
    end
  end
  
  def score
    sum = 0
    @hand.cards.each do |card|
      sum += card.value 
    end
    sum += (@hand.aces.size > 0 && sum < 12) ? 10 : 0
    sum = -1 if sum > 21
    return sum
  end
  
  def state
    score == -1 ? "bust" : score
  end
  
  def show_state
    (!(state == "bust")) ? "Score: #{state}" : "You are bust"
  end
  
  def info
    "Hand: #{show_hand} #{show_state}"
  end
  
  def info_with_name
    "#{@name} has #{cash} #{info}"
  end
end