# frozen_string_literal: true

require_relative 'board'
require_relative 'knight'

BOARD_SIZE = 8

starting_pos = [4, 3]
finishing_pos = [6, 3]

game = ChessBoard.new
game.knight_moves(starting_pos, finishing_pos)
puts ''

starting_pos = [0, 0]
finishing_pos = [8, 8]
game.knight_moves(starting_pos, finishing_pos)
puts ''

starting_pos = [7, 6]
finishing_pos = [3, 1]
game.knight_moves(starting_pos, finishing_pos)
