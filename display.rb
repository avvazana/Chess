
require_relative 'cursor.rb'
require_relative 'board.rb'
require 'byebug'
require 'colorize'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render_grid
    @board.rows.map.with_index do |row, i|
      render_row(row, i)
    end
  end

  def render_row(row, i)
    row.map.with_index do |piece, j|
      tile_color = color_selector(i, j)
      piece.to_s.colorize(tile_color)
    end
  end

  def color_selector(i, j)
    if cursor.cursor_pos == [i, j] && cursor.selected
      tile_color = :light_green
    elsif cursor.cursor_pos == [i, j]
      tile_color = :light_magenta
    elsif (i + j).odd?
      tile_color = :light_cyan
    else
      tile_color = :light_white
    end
    { background: tile_color }
  end

  def render
    system("clear")
    render_grid.each { |row| puts row.join }
  end

  def board_interact
    input = nil
    while input.nil?
      input = cursor.get_input
      self.render
    end
  end
end

# board = Board.new
# board.populate
# display = Display.new(board)
# display.board_interact
