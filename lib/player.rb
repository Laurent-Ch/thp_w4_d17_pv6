class Player
  # Respectiveley string and integer
  attr_accessor :name, :life_points

  def initialize(name_player)
    @name = name_player
    @life_points  = 10
  end

  def show_state
    puts "#{@name} a #{life_points} points de vie"
  end

  def gets_damage(attack_points)
    @life_points -= attack_points
    if life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(target_player)
    puts "le joueur #{@name} attaque le joueur #{target_player.name}"
    hit_points = compute_damage
    target_player.gets_damage(hit_points)
    puts "il lui inflige #{hit_points} points de dommages"
  end

  def compute_damage
    return rand(1..6)
  end

end
