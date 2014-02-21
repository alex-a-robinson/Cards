#!usr/bin/env ruby

require_relative "../General/betting_player"

class BlackJackPlayer < BettingPlayer
  def decide_to_hit?
    unless state == "bust"
      print "Hit or Stick? :"
      choice = gets.chomp.downcase
      abort("Bye.") if choice == "q" || choice == "quit"
      return (choice == "hit" || choice == "h") ? true : false
    end
  end
  
  def action
    print "Stand, hit, double, split or surrender? : "
    choice = gets.chomp.downcase
    "stand" if choice.match(/^st\w+/)
    "hit" if choice.match(/^h\w+/)
    "double" if choice.match(/^d\w+/)
    "split" if choice.match(/^sp\w+/)
    "surrender" if choice.match(/^su\w+/)
    abort("Bye.") if choice.match(/^(ex|qu)it/)
  end
  
  def score
    @hand.score
  end
  
  def rank
    @hand.rank
  end

  def info
    "#{show_hand} (#{@hand.rank})"
  end

  def info_with_name
    "#{@name} has #{cash} #{info}"
  end
end
