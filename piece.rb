

class Piece
  attr_reader :color, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    " #{self.symbol.to_s} "
  end

  def empty?
    false
  end

  def valid_moves
    moves.reject {|end_pos| move_into_check?(end_pos)}
  end

  def pos=(val) #[0,1]
    @pos = val
  end

  def symbol
  end

  private

  def move_into_check?(end_pos)
    #thoroughly test this method
    old_end_piece = @board[end_pos]
    @board.move_piece(pos, end_pos)
    in_check = @board.in_check?(color) ? true : false

    #change it back regardless
    #move back moving piece and return taken piece (or NullPiece) to its original position at end_pos
    @board.move_piece(end_pos, pos)
    @board[end_pos] = old_end_piece

    #raise "You cannot move into check" if
    in_check
  end

  def dup_board
    @board.rows.map {|row| row.dup}
  end

end
