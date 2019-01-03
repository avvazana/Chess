module Slideable
  HORIZONTAL_DIRS = [[1,0], [0,1], [0,-1], [-1,0]].freeze
  DIAGONAL_DIRS = [[-1,-1], [1,1], [1,-1], [-1,1]].freeze

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    vectors = move_dirs
    moves = []
    
    vectors.each do |vector|
      moves_in_dir = grow_unblocked_moves_in_dir(vector[0], vector[1])
      moves += moves_in_dir
    end

    moves
  end

  private

  def move_dirs

    horizontal_dirs + diagonal_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    moves_in_dir = []

    (1..7).each do |multiple|

      pos_temp = [pos[0] + dx*multiple, pos[1] + dy*multiple]
      break unless @board.valid_pos?(pos_temp)
      break if @board[pos_temp].color == self.color

      moves_in_dir << pos_temp
      break unless @board[pos_temp].empty?
    end

    moves_in_dir
  end

end
