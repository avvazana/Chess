class HumanPlayer
  def initialize(color, display)
    super(color, display)
  end

  def make_move
    start_pos = get_input
    end_pos = get_input
    return [start_pos, end_pos]
  end

end
