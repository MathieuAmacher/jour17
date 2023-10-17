require 'bundler'
Bundler.require

require_relative './lib/game'
require_relative './lib/player'

player1 = HumanPlayer.new("Mathieu")
player2 = Player.new("José")
player3 = Player.new("Josianne")

enemy = []                                              # array pour les ennemis s'il y en a plus que 2
enemies = ["player2", "player3"]



puts "-" * 100
puts "\t\t\t |                                              |"
puts "\t\t\t |    Bienvenue sur 'ILS VEULENT TOUS MA POO'   |"
puts "\t\t\t | Le but du jeu est dêtre le dernier survivant |"
puts "\t\t\t |                                              |"
puts "-"*100

# puts "\t\t\t\tWhat's is your name darling !"
# print"\t\t\t\t\t>..."
# gets.chomp = user


while player1.life_points > 0 || player2.life_points > 0 && player3.life_points > 0
    
    if player2.life_points > 0 || player3.life_points > 0

    puts "\nVoici l'état de chaque joueur \n"
    puts "#{player1.show_state} #{player2.show_state} #{player3.show_state}"

    puts "\nPassons à la phase d'attaque"

        # enemies.each do |enemy|
        #     if enemies.life_points > 0                                        # j'ai pas reussi à faire marcher cet array
        #         puts "#{enemy.name}.attack#{player1.name})"
        #         enemy.attack(player1)
        #     break if enemy.life_point <= 0
        #     break if player1.life_point <=0
        #     end
        # end

        if player2.life_points > 0
            puts player2.attack(player1)
        break if player1.life_points <= 0
        end                                                                     # le jeu fonctionne suivant le système 2 ennemis

        if player3.life_points > 0
            puts player3.attack(player1)
        break if player1.life_points <= 0
        end



   
    
    puts "\nQuelle action veux-tu effectuer"
    puts "a - chercher une meilleure arme"
    puts "b - chercher à se soigner"
    puts "\nAttaquer un joueur en vue"

        if player2.life_points > 0
            puts "0 - #{player2.show_state}"
        break if player2.life_points <= 0
        end

        if player3.life_points > 0
            puts "1 - #{player3.show_state}"
        break if player3.life_points <= 0 
        end


        if player2.life_points > 0 || player3.life_points > 0
            choice = gets.chomp
    
            case choice
            when "a"
                player1.search_weapon
            when "b"
                player1.search_health_pack
            when "0"
                player1.attack(player2)
            when "1"
                player1.attack(player3)
            end
        
        else break
        end
    else break
    end
    
end

puts "\t\t\t\t La partie est fini !!!"

    if player1.life_points > 0
        puts "\t\t\t\t  BRAVO ! TU AS GAGNE !"
    else
        puts "\t\t\t\t  LOSER ! TU AS PERDU !"
    end

puts "*" * 100

# binding pry
# puts "end of file"