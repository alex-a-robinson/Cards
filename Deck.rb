class Deck
  def initilize
    @cards = []
  end
  
  def add_card(card)
    @cards.push(card)
  end
  
  def remove_card(index)
    @cards.slice!(index)
  end
  
  def shuffle
    @cards.shuffle
  end
end