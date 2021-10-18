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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name_player)
    @name = name_player
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    random_weapon_barter = rand(1..6)
    puts "tu as trouvé une arme de niveau #{random_weapon_barter}"
    if random_weapon_barter > @weapon_level
      @weapon_level = random_weapon_barter
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    random_health_pack = rand(1..6)
    case 
    when random_health_pack == 1
      puts "Tu n'as rien trouvé..."
    when random_health_pack == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points += 80
    else
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points += 50
    end
    if @life_points > 100
      @life_points = 100
    end
  end

end
