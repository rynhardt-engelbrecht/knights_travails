# frozen_string_literal: true

require_relative 'board'
require 'pry-byebug'

# class representation of the knight chess piece
class Knight
  attr_accessor :position, :children
  attr_reader :parent

  MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, 2], [1, -2], [2, -1], [2, 1]].freeze
  BOARD = ChessBoard.new(8)

  def initialize(position, parent = nil)
    @position = position
    @children = []
    @parent = parent
  end

  def generate_moves
    moves = []

    MOVES.each do |move|
      new_x = position[0] + move[0]
      new_y = position[1] + move[1]

      moves.push([new_x, new_y]) if BOARD.valid_position?(new_x, new_y)
    end

    moves
  end
end
