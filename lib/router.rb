require_relative 'controller'

class Router

  def initialize
    @controller = Controller.new
    @j1 = ""
    @j2 = ""
  end

  def name
    puts "Bonjour et bienvenue dans mon jeu de morpion".green
    puts ""
    puts "Comment s'appelle le Joueur 1".green
    print ">".green
    @j1 =gets.chomp.to_s
    @controller.player_name(@j1)
    puts""
    puts "Merci #{@j1}! Et comment s'appelle le Joueur 2 ?".green
    print ">".green
    @j2 =gets.chomp.to_s
    @controller.player_name(@j2)
    puts ""
    puts "Parfait ! #{@j1}, #{@j2}, c'est parti".green
    puts ""
  end

  def qui_commence
    if rand(0..1) == 0
      puts "#{@j1}, c'est toi qui commence".green
      puts ""
      @tour = true
    else
      puts "#{@j2}, c'est toi qui commence".green
      puts ""
      @tour = false
    end
  end

  def tour
    choix = false
    if @tour1
      puts ""
      puts "#{@j1}, ou veux-tu placer to pion ?".green
    else
      puts ""
      puts "#{@j2}, ou veux-tu placer to pion ?".green
    end
    puts ""
    while choix == false
      @controller.display_options
      puts ""
      print ">".green
      #RAJOUTER UNE LIGNE POUR NE PRENDRE EN COMPTE QUE LES CASES RESTANTES ("CECI N'EST PAS UNE CASE" ET "CETTE CASE EST DEJA PRISE")
      case_choisie = gets.chomp.to_s
      if @controller.options_array.include? case_choisie
        choix = true
        @controller.deja_choisis(case_choisie)
        if @tour1
          @controller.pion_sur_case("X", case_choisie)
        else
          @controller.pion_sur_case("O", case_choisie)
        end
        @controller.display_board
      else
        puts "Cette case n'existe pas ou est deja prise. Choisis-en une autre".green
      end
    end
  end

  
  def perform
    name
    if qui_commence #J1 commence
      @controller.display_board
      for i in (1..9)
        if i % 2 == 0
          @tour1 = false
        else
          @tour1 = true
        end
        tour
        if @controller.win == true
          if i % 2 == 0
            print "Bravo #{@j2}, tu as gagne !"
            break
          else
            print "Bravo #{@j1}, tu as gagne !"
            break
          end
        end
        if i == 9
          print "Il y a egalite"
        end
      end
    else #j2 commence
      @controller.display_board
      for i in (1..9)
        if i % 2 == 0
          @tour1 = true
        else
          @tour1 = false
        end
        tour
        if @controller.win == true
          if i % 2 == 0
            print "Bravo #{@j2}, tu as gagne !"
            break
          else
            print "Bravo #{@j1}, tu as gagne !"
            break
          end
        end
        
        if i == 9
          print "Il y a egalite"
        end
      end
    end
  end


end