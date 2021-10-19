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
  |    WINNIE THE POO(H): RAMPAGE Edition —GotY—    |
  | 'They took my honey... You'll take their lives' |
  ---------------------------------------------------

  "

  # Intro
  puts 'Bienvenue dans WTP:RAMPAGE. Quel est ton nom ?'
  print '>'
  player_name = gets.chomp
  puts
  player1 = HumanPlayer.new(player_name)

  puts "On m'a volé toutes mes réserves, #{player_name}... sans ces sirupeuses rasades de sucres rapides, je ne passerai pas l'hiver. Tu sais ce qu'il te reste à faire : tue les tous ; récupère le miel."
  puts

  enemy1 = Player.new('Josiane')
  enemy2 = Player.new('José')
  enemies = [enemy1, enemy2]

  continue_story

  # Fight
  while player1.life_points >= 0 && (enemy1.life_points >= 0 || enemy2.life_points >= 0)
    puts '|_______________[GET_READY_FOR_A_NEW_ROUND]_______________|'
    puts player1.show_state

    puts 'Quelle action veux-tu effectuer ?'
    puts 'a - chercher une meilleure arme'
    puts 's - chercher à se soigner'
    puts
    puts 'Attaquer un joueur en vue :'
    print '0 - '
    puts enemy1.show_state.to_s
    print '1 - '
    puts enemy2.show_state.to_s
    print('>')
    player_answer = gets.chomp
    possible_answers = %w[a s 0 1]
    until possible_answers.include?(player_answer)
      puts 'Presse a, s, 0 ou 1 puis entrée.'
      player_answer = gets.chomp.to_s
    end
    case player_answer
    when 'a'
      player1.search_weapon
    when 's'
      player1.search_health_pack
    when '0'
      player1.attacks(enemy1)
    when '1'
      player1.attacks(enemy2)
    end

    continue_story

    puts "Les autres joueurs t'attaquent !"
    enemies.each do |enemy|
      enemy.attacks(player1) if enemy.life_points > 0
    end

    continue_story
  end

  if player1.life_points > 0
    puts "Bravo #{player_name}, je vais pouvoir hiberner en paix cet hiver. Prends donc ces lingots d'or inutiles, pâles imitations de mon miel adoré."
  else
    puts "Tu as échoué. Je maigris à vue d'oeil... mes forces s'amoindrissent ; c'est... bientôt la fin."
  end
end

perform
