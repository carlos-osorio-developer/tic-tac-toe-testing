require_relative '../lib/game_logic'

module UserInteraction
  def user_move(user1, user2, board1)
    player_turn = board1.moves_counter.odd? ? user1 : user2
    puts "#{player_turn.name} please enter a move:"
    move_p = gets.chomp.to_i
    board1.make_a_move(move_p, player_turn.marker)
    board1.print_board
    board1.plays_array
  end

  def print_winner(winning_marker, user1, user2)
    if user1.marker == winning_marker
      puts "#{user1.name} Wins!"
    else
      puts "#{user2.name} Wins!"
    end
  end
end

# Player Class: Initialize player name and marker
class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

# Board Class: Draws the board with the current play, checks valid moves, counts moves
class Board
  attr_accessor :plays_array
  attr_reader :moves_counter

  def initialize(plays_array)
    @plays_array = plays_array
    @moves_counter = 1
  end

  def print_board
    col_separator = ' | '
    row_separator = ' +---+---+---+'
    puts row_separator
    3.times do |rows|
      print col_separator
      3.times { |columns| print (@plays_array[columns + (rows * 3)]).to_s + col_separator }
      puts "\n#{row_separator}"
    end
  end

  def make_a_move(num, marker)
    if !num.is_a?(Integer) || !num.between?(1, 9)
      puts 'Invalid move. Please enter a number between 1 and 9'
      return false
    elsif @plays_array[num - 1].is_a?(String)
      return puts 'Invalid move. Position already taken'
    else
      @plays_array[num - 1] = marker
      @moves_counter += 1
    end
  end
  include UserInteraction
  include GameLogic
end

# playername = ''
# while playername.empty?
#   puts 'Enter player 1 name'
#   playername = gets.chomp
#   player1 = Player.new(playername, 'X')
# end

# playername = ''
# while playername.empty?
#   puts 'Enter player 2 name'
#   playername = gets.chomp
#   player2 = Player.new(playername, 'O')
# end

# board1 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
# board1.print_board

# while board1.moves_counter <= 9
#   updated_board = board1.user_move(player1, player2, board1)
#   winning_marker = board1.check_winner(updated_board)
#   board1.print_winner(winning_marker, player1, player2) if winning_marker
#   puts "It's a Draw" if board1.moves_counter == 10
# end
