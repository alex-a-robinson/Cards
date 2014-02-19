class Card
  def initilize(value, value_name, suit, suit_name)
    @value = value
    @value_name = value_name
    @suit = suit
    @suit_name = suit_name
  end
  
  def value
    @value
  end
  
  def suit
    @suit
  end
  
  def show
    puts "#{@value}#{@suit}"
  end
  
  def name
    puts "#{@value_name} of #{@suit_name}"
  end
end