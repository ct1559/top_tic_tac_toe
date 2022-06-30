# Board creates and updates the game board
require_relative "display.rb"

class Board
  attr_accessor :game_board

  include Display

  def initialize
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def update_board(position, mark)
    @game_board[@game_board.index(position)] = mark
  end

end
