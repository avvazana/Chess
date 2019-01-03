require_relative '../piece.rb'

class Pawn < Piece

  def symbol
    '♟'.colorize(color)
  end

  def moves
    fwd_vectors = forward_steps
    fwd_moves = []

    fwd_vectors.each do |vector|
      pos_temp = [self.pos[0] + vector[0] * forward_dir, self.pos[1] + vector[1]]

      next unless @board.valid_pos?(pos_temp)
      next unless @board[pos_temp].empty?

      fwd_moves << pos_temp
    end

    side_moves = side_attacks

    fwd_moves + side_moves
  end

  private

  def at_start_row?
    self.pos[0] == 2 || self.pos[0] == 6
  end

  def forward_dir
    self.color == :black ? -1 : 1
  end

  def forward_steps
    at_start_row? ? [[2,0], [1,0]] : [[1,0]]
  end

  def side_attacks
    side_vectors = [[1,1],[1,-1]]
    side_moves = []

    side_vectors.each do |vector|
      pos_temp = [self.pos[0] + vector[0] * forward_dir, self.pos[1] + vector[1]]

      next unless @board.valid_pos?(pos_temp)
      next if @board[pos_temp].color == color
      next if @board[pos_temp].empty?

      side_moves << pos_temp
    end
    side_moves
  end

end
