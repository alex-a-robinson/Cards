class Dealer
  def initilize(deck)
    @deck = deck
  end
  
  def deal_hand(number_of_cards)
    warn 'Too few cards' if @deck.size < number_of_cards
    @deck.slice!(0, number_of_cards)
  end
end