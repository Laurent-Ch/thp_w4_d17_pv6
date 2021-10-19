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
=begin
# Intro
puts 'Bienvenue dans WTP:RAMPAGE. Quel est ton nom ?'
print '>'
player_name = gets.chomp
puts
my_game = Game.new(player_name)

while my_game.is_still_ongoing? #while, mais pour le moment
  puts my_game.show_players
  puts my_game.menu
end
=end

binding.pry

