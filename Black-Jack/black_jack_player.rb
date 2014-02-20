#!usr/bin/env ruby

require_relative "../Cards/Player"

class BlackJackPlayer < Player
  def decide_to
    if !(state == "bust")
      puts "Hit or Stick?"
      choice = gets.chomp.downcase
      abort("Bye.") if choice == "q" || choice == "quit"
      return (choice == "hit" || choice == "h") ? "hit" : "stick"
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
    puts (!(state == "bust")) ? "Score: #{state}" : "You are bust"
  end
end