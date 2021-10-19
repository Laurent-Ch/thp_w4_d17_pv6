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

puts "
---------------------------------------------------
|    WINNIE THE POO(H): RAMPAGE Edition —v2.0—    |
| 'They took my honey... You'll take their lives' |
---------------------------------------------------

"

# Intro
puts 'Bienvenue dans WTP:RAMPAGE. Quel est ton nom ?'
print '>'

player_name = gets.chomp
puts
my_game = Game.new(player_name)

while my_game.is_still_ongoing?
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

binding.pry
