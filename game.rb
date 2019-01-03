require_relative 'board'
require_relative 'player'
require_relative 'display'


class Game
  attr_reader :board, :display, :players, :current_player

  def initialize

    @board = Board.new
    @board.populate
    @display = Display.new(@board)
    @players = {
      white: Player.new(:white, @display),
      black: Player.new(:black, @display)
    }
    @current_player = :white
  end

  def play
    until board.checkmate?(current_player)
        start_pos, end_pos = players[current_player].make_move(board)
        board.move_piece(start_pos, end_pos)
    end
    display.render
    puts "#{current_player} has been checkmated."
  end
end
end

if $PROGRAM_NAME == __FILE__

  Game.new.play
end
