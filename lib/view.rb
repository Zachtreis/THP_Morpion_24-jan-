require_relative 'board'

class View

  def display_board
    puts "     | A | B | C
    -|---|---|---  
    1| #{@board_array[0]} |   |
    -|---|---|---
    2|   |   |
    -|---|---|---
    3|   |   |   "
    puts ""
  end

end