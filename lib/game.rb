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

  #   This class version doesn't suit me
  #   def kill_player(player_to_kill)
  #   @enemies.each do |i|
  #     @enemies.delete(i) if i.name == player_to_kill
  #   end

  # More convenient version
  def kill_players
    enemies.each do |i|
      if i.life_points <= 0
        @enemies.delete(i) 
      end
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
    puts "Quelle action veux-tu effectuer ? Tape a, s, ou le chiffre d'un ennemi encore présent."
    puts 'a - chercher une meilleure arme'
    puts 's - chercher à se soigner'
    puts

    puts 'attaquer un joueur en vue :'
    counter = 0
    @enemies.each do |i|
      print "#{counter} - "
      puts i.show_state.to_s
      counter += 1
    end
  end

  # This method isn't perfect: any other character than 'a' or 's' is converted into 0, so Player0 gets attacked.
  def menu_choice(user_input)
    possible_string = user_input.to_s
    possible_integer = user_input.to_i
    if possible_string == 'a'
      @human_player.search_weapon
    elsif possible_string ==  's'
      @human_player.search_health_pack
    elsif possible_integer <= @enemies.size - 1
      human_player.attacks(@enemies.at(possible_integer))
    else
      puts 'please enter a, s, or the number of a remaining enemy'
    end
  end

  def enemies_attack
    @enemies.each do |i|
      i.attacks(@human_player)
    end
  end

  def end
    if @human_player.life_points > 0
      puts "Bravo #{@human_player.name}, je vais pouvoir hiberner en paix cet hiver. Prends donc ces lingots d'or inutiles, pâles imitations de mon miel adoré."
    else
      puts "Tu as échoué. Je maigris à vue d'oeil... mes forces s'amoindrissent ; c'est... bientôt la fin."
    end
  end
end
