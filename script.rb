# Commit often
# TDD as much as I can

# Gameplay loop: The board is shown. The first player is whites. Which player needs to play is shown by a message. A player then clicks a letter to show in what square the piece he is going to move is. The piece is highlighted in red. Then the player will select a row, and then a column. If the move is illegal, a warning sign will appear and clicking enter will do nothing. If it is legal, clicking enter will move the piece.
# Every piece is an object, which has an array of legal moves. When the player moves, unless the move he choses is in that array, a warning will appear.

# Steps:
# 1. Create board with unicode characters
# 2. Make base movements for each piece
# 3. Make 2 player turn-based behaviour
# 4. Implement win or draw conditions
# 5. Implement special features (pawn reaching end, enroc)
# 6. Implement saving and loading of games
# 7. Implement AI that makes random moves

# 1. Create board with unicode characters
# Board should be an 8x8 matrix: 8 arrays, named row1, row2, row3, ..., row8, each one containig ai, bi, ci, ..., hi, where i is the row number. The first array on the board matrix is row8, and the last one row1

# frozen_string_literal: true

include './pieces'

WP = '♙'
WK = '♔'
WQ = '♕'
WR = '♖'
WB = '♗'
WN = '♘'
BP = '♟'
BK = '♚'
BQ = '♛'
BR = '♜'
BB = '♝'
BN = '♞'
SQUARE = '·'
SELECTED_SQUARE = 'x'
LETTERS = %w[a b c d e f g h]

class Game
  def initialize
    @board = []
    @board_to_print = Array.new(9) { Array.new(9, SQUARE) }
    populate_boards
  end

  def populate_boards
    8.times do |i|
      8.times do |j|
        @board << [i, j]
      end
    end
    @board_to_print.each_with_index do |arr, i|
      arr[0] = letters[i]
    end
    @board_to_print[8] = [' '] + %w[1 2 3 4 5 6 7 8]
  end

  def print_board
    @board_to_print.each do |row|
      print "#{row.join(' ')}\n"
    end
  end
end

game = Game.new
game.print_board