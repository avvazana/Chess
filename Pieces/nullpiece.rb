require_relative '../piece.rb'
require 'singleton'

class NullPiece < Piece

  include Singleton

  def initialize
    @color = :none
  end

  def symbol
    " "
  end

  def moves
    []
  end

  def empty?
    true
  end

end
