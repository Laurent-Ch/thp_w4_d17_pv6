puts "Quelle action veux-tu effectuer ?"
  puts "0 - chercher une meilleure arme"
  puts "1 - chercher à se soigner"
  puts ()
  puts "attaquer un joueur en vue :"
  puts "2 - #enemy1.show_state"
  puts "3 - #enemy2.show_state"
  print('>')
  player_answer = gets.chomp
  player_answer
  possible_answers = ["a", "s", "0", "1"]
  while !possible_answers.include?(player_answer)
    puts "Presse a, s, 0 ou 1 puis entrée."
    player_answer = gets.chomp.to_s
  end
