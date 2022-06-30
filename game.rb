class Game

  def initialize(player1, player2)
    @board = Board.new()
    @player1 = player1
    @player2 = player2
    @player_turn = first_turn
    @round_num = 1
  end

  def play
    @board.display(@board.game_board)
    @player_turn.odd? ? get_input(@player1) : get_input(@player2)
    puts
    puts
    if winner(@board.game_board) != 'no winner yet'
      @board.display(@board.game_board)
      puts "#{winner(@board.game_board)} won the game!\n\n"
    elsif @round_num == 9
      @board.display(@board.game_board)
      puts "It's a draw!\n\n"
    else
      @player_turn += 1
      @round_num += 1
      play
    end
  end

  def get_input(player)
    puts "#{player.name} enter the position to place mark (1-9)"
    user_input = gets
    if (1..9).include?(user_input.to_i) && @board.game_board[user_input.to_i - 1].is_a?(Integer)
      @board.update_board(user_input.to_i, player.mark) 
    else
      puts 'Invalid input, try again'
      get_input(player)
    end
  end

  def first_turn
    rand(1..2)
  end

  def winner(board)
    winning_combos = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [3, 4, 5], [6, 7, 8], [6, 4, 2], [1, 4, 7], [2, 5, 8]]
    winning_combos.each do |combo|
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] 
        if @player_turn.odd?
          return @player1.name
        else
          return @player2.name
        end
      end
    end
    return 'no winner yet'
  end

end
