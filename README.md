# Chess
Command Line Chess Written in Ruby

![alt text](https://github.com/avvazana/Chess/raw/master/chess_board.png)

## Logic
* Piece.rb contains the parent class of all piece objects (pawn, queen, king, etc).
* Each piece has certain 'move directions' that factor into it's legal moves.
Example (for a Knight):
```ruby
L_DIRS = [[1,2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,-1], [1,-2], [-2,1]]

def moves
  vectors = move_diffs
  moves = []

  vectors.each do |vector|
    pos_temp = [self.pos[0] + vector[0], self.pos[1] + vector[1]]

    next unless @board.valid_pos?(pos_temp)
    next if @board[pos_temp].color == self.color

    moves << pos_temp
  end

  moves
end
protected

def move_diffs
  L_DIRS
end
```


## Notable Classes

* Game: The game class is responsible for actually running the game. It holds the game loop.
```ruby
  def play
    until board.checkmate?(current_player)
        start_pos, end_pos = players[current_player].make_move(board)
        board.move_piece(start_pos, end_pos)
    end
    display.render
    puts "#{current_player} has been checkmated."
  end
```

* Board: The board class is responsible for initializing the board and moving the pieces. It also handles the logic for ensuring a move is valid, finding the king, and checking if a player has been checkmated.
```ruby
  def move_piece(start_pos, end_pos)
    moved_piece = self[start_pos]
    self[start_pos], self[end_pos] = NullPiece.instance, moved_piece
    moved_piece.pos = end_pos
    nil
  end
```

## Features
* Arrow Keys for movement
* Colorized UI
* Notifies players on whose turn it is
* Object Oriented Design Features: Inheritance and Polymorphism


## Setting Up
* gem install 'colorize'
* ruby game.rb
