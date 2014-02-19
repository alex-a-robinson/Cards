CARD_VALUES = 
  {'A' : 1, 2 : 2, 3 : 3, 4 : 4, 5 : 5, 6 : 6, 7 : 7,
   8 : 8, 9 : 9, 'J' : 10, 'Q' : 11, 'K' : 12}

CARD_VALUE_NAMES = 
  {'A' : 'Ace', 2 : 'Two', 3 : 'Three', 4 : 'Four',
   5 : 'Five', 6 : 'Six', 7 : 'Seven', 8 : 'Eight',
   9 : 'Nine', 'J' : 'Jack', 'Q' : 'Queen', 'K' : 'King'}
       
CARD_SUITS = {'♠' : 'S', '♥' : 'H', '♦' : 'D', '♣' : 'C'}
CARD_SUIT_NAMES = {'S' : 'Spades', 'H' : 'Hearts', 
  'D' : 'Diamonds', 'C' : 'Clubs'}


class English52CardDeck < Deck
  def initilize
    @deck = []
    CARD_SUITS.each do |suit|
      CARD_VALUES.each do |value|
        suit_name = CARD_SUIT_NAMES[suit]
        value_name = CARD_VALUE_NAMES[value]
        
        card = Card.new(value, value_name, 
                 suit, suit_name)
        @deck.push(card)
      end
    end
  end
end