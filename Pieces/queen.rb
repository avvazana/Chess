require_relative '../piece.rb'
require_relative 'slideable.rb'

class Queen < Piece
  include Slideable

  def symbol
    "\u2655".encode('utf-8')
  end

  protected

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end


end
