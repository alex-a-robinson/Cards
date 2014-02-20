#!usr/bin/env ruby

require_relative "black_jack_game"
require_relative "black_jack_player"
require_relative "black_jack_dealer"
require_relative "black_jack_deck"

deck = BlackJackDeck.new
dealer = BlackJackDealer.new(deck, "Steve")
player1 = BlackJackPlayer.new("Alex", 50)
player2 = BlackJackPlayer.new("John", 50)
player3 = BlackJackPlayer.new("Sam", 50)

game = BlackJackGame.new(dealer)

game.add_player(player1)
game.add_player(player2)
game.add_player(player3)

game.play