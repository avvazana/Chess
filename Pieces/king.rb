
require_relative '../piece.rb'

class King < Piece
  HORIZONTAL_DIRS = [[1,0], [0,1], [0,-1], [-1,0]].freeze
  DIAGONAL_DIRS = [[-1,-1], [1,1], [1,-1], [-1,1]].freeze

  def symbol
    '♚'.colorize(color)
  end

  def moves
    vectors = move_diffs
    moves = []

    vectors.each do |vector|
      pos_temp = [self.pos[0] + vector[0], self.pos[1] + vector[1]]

      next unless board.valid_pos?(pos_temp)
      next if board[pos_temp].color == self.color

      moves << pos_temp
    end

    moves
  end

  protected

  def move_diffs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end

end
