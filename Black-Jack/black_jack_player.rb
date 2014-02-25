#!usr/bin/env ruby

require_relative "../General/betting_player"

class BlackJackPlayer < BettingPlayer
  
  def action
    print "Stand, hit, double, split or surrender? : "
    while true
      choice = gets.chomp.downcase
      return "stand" if /^st\w*/.match(choice)
      return "hit" if /^h\w*/.match(choice)
      return "double" if /^d\w*/.match(choice)
      return "split" if /^sp\w*/.match(choice)
      return "surrender" if /^su\w*/.match(choice)
      print "Please type one of stand, hit, double, split or surrender: "
    end
  end
  
  def split_action
    print "Stand, hit or double? : "
    while true
      choice = gets.chomp.downcase
      return "stand" if /^st\w*/.match(choice)
      return "hit" if /^h\w*/.match(choice)
      return "double" if /^d\w*/.match(choice)
      print "Please type one of stand, hit, double, split or surrender: "
    end
  end
  
  def hit?
    print "Hit again? : "
    choice = gets.chomp.downcase
    choice.match(/^y\w*/) ? true : false
  end
  
  def score
    @hand.score
  end
  
  def rank
    @hand.rank
  end

  def info
    "#{@hand.show} (#{@hand.rank})"
  end

  def info_with_name
    if @hand != nil
      "#{@name} has #{show_cash} #{info}"
    else
      "#{@name} has #{show_cash}"
    end
  end
  
  def join_table(table)
    table.players.push(self)
  end
  
  def bust?
    rank == "bust" ? true : false
  end
end
