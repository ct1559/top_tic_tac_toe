class Game

  winning_combos = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [4, 5, 6], [7, 8, 9], [7, 5, 3]]
  
  def initialize(player1, player2)
    @board = Board.new()
    @player1 = player1
    @player2 = player2
    @player_turn = first_turn()
  end
  
  def play
    @player_turn.odd? ? get_input(@player1) : get_input(@player2)
    @player_turn += 1
    @board.display(@board.game_board)
    p @board.game_board
    winner?(@board) ? "You won the game!" : play()
  end

  def get_input(player)
    puts "#{player.name} enter the position to place mark (1-9)"
    user_input = gets
    if (1..9).include?(user_input.to_i) && @board.game_board[user_input.to_i - 1].is_a?(Integer)
      @board.game_board[user_input.to_i - 1] = player.mark
    else
      puts "Invalid input, try again"
      get_input(player)
    end
  end
  
  def first_turn
    rand(1..2)
  end

  def winner?(board)
    return false
  end
  
end