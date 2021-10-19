NUMBER_OF_ENEMIES = 4
class Game
  attr_accessor :human_player, :enemies

  def initialize(character_name)
    @human_player = HumanPlayer.new(character_name)
    @enemies = []
    NUMBER_OF_ENEMIES.times do |i|
      @enemies << Player.new("Player#{i}")
    end
  end

  # En travaux
  def kill_player(player_to_kill)
    @enemies.each do |i|
      @enemies.delete(i) if i.name == player_to_kill
    end
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && !@enemies.empty? ? true : false
  end
  
  def show_players
    puts @human_player.show_state
    puts "il reste #{@enemies.size} bots."
  end

  def menu
    puts 'Quelle action veux-tu effectuer ?'
    puts 'a - chercher une meilleure arme'
    puts 's - chercher à se soigner'
    puts ()

    puts 'attaquer un joueur en vue :'
    @enemies.each do |i|
      puts '#{i} - #enemy1.show_state'
      puts '1 - #enemy2.show_state'
  end

end
