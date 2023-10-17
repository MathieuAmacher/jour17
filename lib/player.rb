require 'pry'

class Player                                        #pour les paramètres de class Player
    attr_accessor :name, :life_points               #les attributs accessible en lecture et en écriture


    
    
    def initialize(name)                            #on rentre les paramètres essentiel
        @life_points = 10                           #les points de vie
        @name = name                                # le nom du ou des joueurs
    end

    def show_state                                            
        "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage)
        @life_points = @life_points - damage

        if @life_points == 0 || @life_points < 0                #pour que signé la mort du joueur
            puts "le joueur #{name} a été tué !"
        else
            puts "#{name} a #{@life_points} points de vie"    
        end

    end

    def attack(player)
        puts "le joueur #{@name} attaque le joueur #{player.name}"
        damage = compute_damage                                         #
         puts "il lui inflige #{damage} points de dommage"
        player.gets_damage(damage)
    end

    def compute_damage
        return rand (1..6)                                              # fonction rand pour un dé à 6 faces
    end
end

class HumanPlayer < Player
        attr_accessor :weapon_level

    def initialize (name)
        @name = name
        @life_points = 100                          
        @weapon_level = 1
    end

    def show_state
        "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."          # mettre un # renvoie à la ligne
    end

    def compute_damage
        rand(1..6) * @weapon_level                      #weapon_level est déjà considéré comme un integer
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

        if new_weapon_level > @weapon_level
            @weapon_level = new_weapon_level
            puts "Tu as trouvé une arme plus puissante"                     # on change d'arme si celle ci est de puissance supérieure
        else
            puts "Dommage tu gardes la même arme"
        end
    end

    def search_health_pack
        result = rand(1..6)
        puts "Le Health Pack est de niveau #{result}"

        if result == 1
            puts "Tu n'as rien trouvé"
        elsif result >=2 && result <=5
            @life_points += 50
            @life_points = [100, @life_points].min                                  # ctte fonction est à révisé
            puts "Bravo, tu as trouvé un pack de + 50 points de vie"                   # le nombre de point de vie ne dépasse pas 100
        else result = 6
            @life_points += 80
            @life_points = [100, @life_points].min
            puts "Waow, tu as trouvé un pack de +80 points de vie"
        end
    end

end    


