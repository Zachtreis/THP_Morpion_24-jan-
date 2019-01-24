require_relative 'pion'

class Board

  attr_accessor :board_array, :deja_choisis

  def initialize
    @board_hash = { "A1" => " ", 
    "A2" => " ", 
    "A3" => " ", 
    "B1" => " ", 
    "B2" => " ", 
    "B3" => " ", 
    "C1" => " ", 
    "C2" => " ", 
    "C3" => " " }
    @deja_choisis = []
    @options = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    @win = false
  end

  def display_board
    puts "     | A | B | C
    -|---|---|---  
    1| #{@board_hash['A1'].red} | #{@board_hash['B1'].red} | #{@board_hash['C1'].red} 
    -|---|---|---
    2| #{@board_hash['A2'].red} | #{@board_hash['B2'].red} | #{@board_hash['C2'].red} 
    -|---|---|---
    3| #{@board_hash['A3'].red} | #{@board_hash['B3'].red} | #{@board_hash['C3'].red} "
    puts ""
  end
  
  def win_ligne
    @board_array = [ [@board_hash['A1'], @board_hash['A2'], @board_hash['A3']], [@board_hash['B1'], @board_hash['B2'], @board_hash['B3']], [@board_hash['C1'], @board_hash['C2'], @board_hash['C3']]]
    for i in (0..2)
      xcounter = 0
      ocounter = 0
      for j in (0..2)
        if @board_array[i][j] == "X"
          xcounter +=1
        elsif
          @board_array[i][j] == "O"
          ocounter +=1
        end
      end
      if xcounter == 3 || ocounter == 3
        @win = true
      end
    end
    return @win
  end

  def win_colonne
    @board_array = [ [@board_hash['A1'], @board_hash['A2'], @board_hash['A3']], [@board_hash['B1'], @board_hash['B2'], @board_hash['B3']], [@board_hash['C1'], @board_hash['C2'], @board_hash['C3']]]
    for i in (0..2)
      xcounter = 0
      ocounter = 0
      for j in (0..2)
        if @board_array[j][i] == "X"
          xcounter +=1
        elsif
          @board_array[j][i] == "O"
          ocounter +=1
        end
      end
      if xcounter == 3 || ocounter == 3
        @win = true
      end
    end
    return @win
  end

  def win_diagonale
    if ((@board_hash['A1'] == @board_hash['B2']) && (@board_hash['A1'] == @board_hash['C3']) && (@board_hash['A1'] != " ")) || ((@board_hash['A3'] == @board_hash['B2']) && (@board_hash['A3'] == @board_hash['C1']) && (@board_hash['A3'] != " "))
      @win = true
      return @win
    end
  end

  def win
    if win_ligne || win_colonne || win_diagonale
      return true
    else
      return false
    end
  end

  # def win_colonne
  #   if ((@board_hash['A1'] == @board_hash['B1']) && (@board_hash['A1'] == @board_hash['C1'])) || ((@board_hash['A2'] == @board_hash['B2']) && (@board_hash['A2'] == @board_hash['C2'])) || ((@board_hash['A3'] == @board_hash['B3']) && (@board_hash['A3'] == @board_hash['C3']))
  #     win = true
  #   end
  #   if ((@board_hash['A1'] == @board_hash['A2']) && (@board_hash['A1'] == @board_hash['A3'])) || ((@board_hash['A2'] == @board_hash['B2']) && (@board_hash['A2'] == @board_hash['C2'])) || ((@board_hash['A3'] == @board_hash['B3']) && (@board_hash['A3'] == @board_hash['C3']))







    

  def pion_sur_case(shape, case_choisie)
    @board_hash[case_choisie] = shape
  end

 def options_array
  return @options
 end


  def display_options
    @options = @options.reject { |r| @deja_choisis.include? r}
    @options.each do |case_vide|
      print "#{case_vide}  "
    end
    puts ""
  end

  def case_choisie
    return @deja_choisis
  end

  def tests
    puts @options
    puts ""
    puts @deja_choisis
  end
end