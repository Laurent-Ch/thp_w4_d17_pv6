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
  puts "
  ---------------------------------------------------
  |    WINNIE THE POO(H): RAMPAGE Edition —v3.0—    |
  | 'They took my honey... You'll take their lives' |
  ---------------------------------------------------

  "
  # Intro
  puts 'Bienvenue dans WTP:RAMPAGE. Quel est ton nom ?'
  print '>'

  player_name = gets.chomp
  puts
  my_game = Game.new(player_name)
  puts "On m'a volé toutes mes réserves, #{player_name}... sans ces sirupeuses rasades de sucres rapides, je ne passerai pas l'hiver. Tu sais ce qu'il te reste à faire : tue les tous ; récupère le miel."

  while my_game.is_still_ongoing?
    puts '|_______________[GET_READY_FOR_A_NEW_ROUND]_______________|'
    puts my_game.show_players
    my_game.menu
    print '>'
    user_input = gets.chomp
    my_game.menu_choice(user_input)

    continue_story

    my_game.kill_players

    my_game.enemies_attack

    continue_story

  end
  my_game.end
end

perform
