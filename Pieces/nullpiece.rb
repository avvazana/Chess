require_relative '../piece.rb'
require 'singleton'

class NullPiece < Piece

  include Singleton

  def initialize

  end

  def symbol
    :O
  end


end
