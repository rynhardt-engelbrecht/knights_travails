# frozen_string_literal: true

require_relative 'knight'
require 'pry-byebug'

# class representation of a chess board
class ChessBoard
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def valid_position?(pos_x, pos_y)
    pos_x.between?(1, size) && pos_y.between?(1, size)
  end

  def knight_moves(origin, destination)
    current = build_tree(origin, destination)
    history = []

    until current.position == origin
      history << current.position
      current = current.parent
    end

    history << current.position
    print_moves(history, origin, destination)
  end

  private

  def build_tree(origin, destination)
    queue = [Knight.new(origin)]
    current = queue.shift
    until current.position == destination
      current.generate_moves.each do |move|
        current.children << knight = Knight.new(move, current)
        queue << knight
      end

      current = queue.shift
    end

    current
  end

  def print_moves(history, origin, destination)
    puts "You made it in #{history.size - 1} moves! Here's your path:"
    history.reverse.each do |move|
      str = String.new("[#{move.join(', ')}]")
      if move == origin
        str << ' - Starting point'
      elsif move == destination
        str << ' - Destination'
      end

      puts str
    end
  end
end
