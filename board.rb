require 'byebug'

require_relative 'requires.rb'

class NoPieceError < StandardError ; end
class InvalidMoveError < StandardError ; end
class InvalidPosError < StandardError ; end

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    rows[row][col] = val
  end

  def populate

    back_row = ["Rook", "Knight", "Bishop", "Queen", "King", "Bishop", "Knight", "Rook"]

    rows[0] = back_row.map.with_index {|class_name, idx| Object.const_get(class_name).new(:black, self, [0, idx])}
    rows[1] = (0..7).to_a.map {|idx| Pawn.new(:black, self, [1, idx])}
    (2..5).each do |row|
      rows[row] = (0..7).to_a.map {|idx| NullPiece.instance}
    end
    rows[6] = (0..7).to_a.map {|idx| Pawn.new(:white, self, [6, idx])}
    rows[7] = back_row.map.with_index {|class_name, idx| Object.const_get(class_name).new(:white, self, [7, idx])}.reverse
  end

  def move_piece(start_pos, end_pos)

    # raise NoPieceError if self[start_pos].is_a?(NullPiece)
    moved_piece = self[start_pos]
    self[start_pos], self[end_pos] = NullPiece.instance, moved_piece
    moved_piece.pos = end_pos
    nil
    #come back and check that this is the right way to update the moved piece's position instance variable
  end

  #just check if pos is on the board
  def valid_pos?(pos)

    row, col = pos
    return false unless (0..7).to_a.include?(row) && (0..7).to_a.include?(col)
    true
  end

  def in_check?(color)
    current_king = find_king(color)
    other_color = (color == :black ? :grey : :black)
    other_pieces = pieces(other_color)

    other_pieces.any? {|piece| piece.valid_moves.include?(current_king.pos)}
  end

  def checkmate?(color)
    return false unless in_check?(color)

    pieces.select { |p| p.color == color }.all? do |piece|
      piece.valid_moves.empty?
    end
  end

  def find_king(color)
    pieces(color).select{|el| el.is_a?(King)}.first
  end

  def pieces(color)

    my_pieces = []

    rows.each do |row|
      row.each do |el|
        if el == nil
          next
        elsif el.color == color
          my_pieces << el
        end
      end
    end

    my_pieces
  end
end
