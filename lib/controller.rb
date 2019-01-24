require_relative 'player'
require_relative 'board'
require_relative 'pion'
require_relative 'view'


class Controller

  attr_accessor :options


	def initialize
    # @view = View.new
    @board = Board.new
  end
  
  def player_name(name)
    Player.new(name)
  end

  def display_board
    @board.display_board
  end

  def display_options
    @board.display_options
  end

  def deja_choisis(case_choisies)
    @board.case_choisie << case_choisies
  end

  def test
    puts @board.tests
  end

  def pion_sur_case(shape, case_choisie)
    @board.pion_sur_case(shape, case_choisie)
  end

  def win
    return @board.win
  end

  def options_array
    return @board.options_array
  end
end