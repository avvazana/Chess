class Game
  attr_reader :board, :display, :players, :current_player

  def initialize
    @board = Board.new
    @display = Display.new(board)
    @players = {
      white: HumanPlayer.new(white, @display)
      black: HumanPlayer.new(black, @display)
    }
    @current_player = :white
  end

  def play
    until board.checkmate?(current_player){
      moves = current_player.make_move
      board.move_piece(moves[0], moves[1])
    }

  end

  def make_move

  end

end
