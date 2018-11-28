require_relative '../piece.rb'
require_relative 'slideable.rb'

class Rook < Piece
  include Slideable

  def symbol
    "\u2656".encode('utf-8')
  end

  protected

  def move_dirs
    horizontal_dirs
  end

end
