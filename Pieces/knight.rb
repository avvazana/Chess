require_relative '../piece.rb'

class Knight < Piece
  L_DIRS = [[1,2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,-1], [1,-2], [-2,1]]

  def symbol
    "\u2658".encode('utf-8')
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
    L_DIRS
  end

end
