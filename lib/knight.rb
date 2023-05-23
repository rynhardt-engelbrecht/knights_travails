# frozen_string_literal: true

require_relative 'board'
require 'pry-byebug'

# class representation of the knight chess piece
class Knight
  MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, 2], [1, -2], [2, -1], [2, 1]]
  BOARD = ChessBoard.new(8)

  def generate_moves(position)
    moves = []

    MOVES.each do |move|
      new_x = origin[0] + move[0]
      new_y = origin[1] + move[1]

      moves.push([new_x, new_y]) if BOARD.valid_position?(new_x, new_y)
    end

    moves
  end
end
