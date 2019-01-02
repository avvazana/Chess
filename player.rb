require_relative 'display'

class Player

  attr_accessor :symbol, :display

  def initialize(color, display)
    @display = display
    @color = color
  end


  def make_move(_board)
    start_pos, end_pos = nil, nil

    until start_pos && end_pos
      display.render

      if start_pos
        puts "#{@color}'s turn. Move to where?"
        end_pos = display.cursor.get_input
      else
        puts "#{@color}'s turn. Move from where?"
        start_pos = display.cursor.get_input
      end
    end

    [start_pos, end_pos]
  end
end
