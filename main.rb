require_relative "game.rb"
require_relative "board.rb"
require_relative "player.rb"

def play_game
  puts "Enter Player 1's name"
  player1_name = gets
  puts "Enter Player 2's name"
  player2_name = gets

  player1 = Player.new(player1_name.chomp, 'X')
  player2 = Player.new(player2_name.chomp, 'O')
  
  game = Game.new(player1.name, player2.name)
  game.play()
  play_again()
end



def play_again
  puts "Type 'y' and hit enter to play again. Type 'n' and hit enter to quit"
  answer = gets
  if answer.chomp == 'y'
    play_game()
  elsif answer.chomp =='n'
    puts "GAME OVER"
  else
    puts "Invalid input, please try again"
    play_again
  end
end

 play_game()