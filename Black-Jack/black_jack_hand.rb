#!usr/bin/env ruby

require_relative "black_jack_deck"

class BlackJackHand < Hand
  def initalise
    super
    
    @soft = false
  end
  
  def aces
    ace_cards = []
    @cards.each do |card|
      ace_cards.push(card) if card.value_name == 'A'
    end
    return ace_cards
  end
  
  def faces
    # Review: This includes the value 10 as well as J, Q and K
    face_cards = []
    @cards.each do |card|
      face_cards.push(card) if card.value == 10
    end
    return face_cards
  end
  
  def score
    sum = 0
    @cards.each do |card|
      sum += card.value
    end
    if aces.size > 0 && sum < 12
      @soft = false
      sum += 10
    end
    return sum
  end
  
  def soft?
    @soft
  end
  
  def visible_ace?
    visible_cards.each do |card|
      return true if card.ace?
    end
    return false
  end
  
  def pair?
    # NOTE: This is a pair by value i.e. 2♠ and 2♥
    #       make a pair as they both have value 2
    # NOTE: Even if there are three cards of the 
    #       same value a pair will still be true
    card_values = {}
    @cards.each do |card|
      card_values[card.value] == nil ? card_values[card.value] = 1 : (return true)
    end
    return false
  end
  
  def rank
    if score > 21
      "bust"
    elsif size == 2 && aces.size == 1 && faces.size == 1
      "blackjack"
    elsif size >= 5
      "five-card charlie"
    else
      score
    end
  end
end