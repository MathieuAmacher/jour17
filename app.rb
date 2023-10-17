require 'bundler'
Bundler.require

require_relative './lib/game'
require_relative './lib/player'


player1 = Player.new("José")
player2 = Player.new("Josianne")

puts "A ma droite #{player1.name}"
puts "A ma gauche #{player2.name}"


while player1.life_points > 0 || player2.life_points > 0
    
    puts "Voici l'état de chaque joueur"
    print "\r"
    puts "#{player1.show_state} #{player2.show_state}"

    puts "Passons à la phase d'attaque"
    puts player2.attack(player1)
        break if player1.life_points <= 0
    puts player1.attack(player2)
        break if player2.life_points <= 0

    
end




binding.pry