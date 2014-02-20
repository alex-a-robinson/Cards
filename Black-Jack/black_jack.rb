#!usr/bin/env ruby

require_relative "black_jack_game"
require_relative "black_jack_player"
require_relative "black_jack_dealer"
require_relative "../General/standard_deck"

deck = StandardDeck.new
dealer = BlackJackDealer.new(deck, "Steve")
player1 = BlackJackPlayer.new("Alex")
player2 = BlackJackPlayer.new("John")
player3 = BlackJackPlayer.new("Sam")

game = BlackJackGame.new(dealer)

game.add_player(player1)
game.add_player(player2)
game.add_player(player3)

game.play