#!usr/bin/env ruby

require_relative "black_jack_game"
require_relative "black_jack_player"
require_relative "black_jack_dealer"
require_relative "black_jack_deck"
require_relative "black_jack_table"

deck = BlackJackDeck.new
dealer = BlackJackDealer.new(deck, "Steve")

player1 = BlackJackPlayer.new("Alex", 50)

game = BlackJackGame.new(dealer)

table = new BlackJackTable(dealer)
table.game = game
player1.join_table(table)

game.add_player(player1)
game.add_player(player2)
game.add_player(player3)

game.play
