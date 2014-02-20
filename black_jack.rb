#!usr/bin/env ruby

require "./black_jack_game"
require "./black_jack_player"
require "./black_jack_dealer"
require "./standard_deck"

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