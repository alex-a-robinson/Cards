class Game
  @name = 'The name of the Game'
  @rules = 'The games rules'
  @players
  
  def add_player(player)
    @players.push(player)
  end
  
  def print_rules
    puts @rules
  end
end