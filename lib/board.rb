# frozen_string_literal: true

# class representation of a chess board
class ChessBoard
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def valid_position?(pos_x, pos_y)
    pos_x.between?(1, size) && pos_y.between?(1, size)
  end
end
