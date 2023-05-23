# frozen_string_literal: true

require_relative 'board'

# class representation of the knight chess piece
class Knight
  attr_accessor :position, :children
  attr_reader :parent

  MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, 2], [1, -2], [2, -1], [2, 1]].freeze

  def initialize(position, parent = nil, board_size = 8)
    @position = position
    @board_size = board_size
    @children = []
    @parent = parent
  end

  def generate_moves
    moves = []

    MOVES.each do |move|
      new_x = position[0] + move[0]
      new_y = position[1] + move[1]

      moves.push([new_x, new_y]) if valid_position?(new_x, new_y)
    end

    moves
  end

  def valid_position?(pos_x, pos_y)
    pos_x.between?(1, @board_size) && pos_y.between?(1, @board_size)
  end
end
