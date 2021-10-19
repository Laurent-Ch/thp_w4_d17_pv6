require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def continue_story
  puts
  print 'press any key to continue'
  STDIN.getch
  puts
end

def perform
player1 = Player.new('Josiane')
player2 = Player.new('José')

# Current state.
while player1.life_points > 0 && player2.life_points > 0
  puts
  puts '|_______________[GET_READY_FOR_A_NEW_ROUND]_______________|'
  puts "Voici l'état de chaque joueur :"
  print player1.show_state
  print player2.show_state
  puts

  continue_story

  puts '|________________________[FIGHT!!]________________________|'
  # Round
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  break if player2.life_points <= 0

  player2.attacks(player1)

  continue_story
end

perform

