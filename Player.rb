class Player
  def initilize(name)
    @name = name
  end
  
  def give_hand(hand)
    @hand = hand
  end
  
  def say_name
    puts @name
  end
end