NUMBER_OF_ENEMIES = 4
class Game
  attr_accessor :human_player, :enemies
  
  def initialize(character_name)
    @human_player = HumanPlayer.new(character_name)
    @enemies = []
    NUMBER_OF_ENEMIES.times do |i|
      @enemies << "Player#{i}"
    end
    puts enemies
  end

  # En travaux
  def kill_player(dead_player)
    enemies.delete(dead_player)
  end


end
