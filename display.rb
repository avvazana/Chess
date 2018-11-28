
require_relative 'cursor.rb'
require_relative 'board.rb'
require 'byebug'
require 'colorize'

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render

    board.rows.each_with_index do |row, i|
      puts "----------------------------------"
      row.each_with_index do |el, j|
        print " | "
        if [i,j] == cursor.cursor_pos
          print el.to_s.colorize(:red)
        else
          print el.to_s.colorize(el.color)
        end
      end
      puts " |"
    end
  end

  def board_interact
    input = nil
    while input.nil?
      input = cursor.get_input
      self.render
    end
  end
end

board = Board.new
board.populate
display = Display.new(board)
display.board_interact
