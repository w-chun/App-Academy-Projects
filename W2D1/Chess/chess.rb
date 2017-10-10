require_relative "board.rb"
require_relative "display.rb"
require_relative "piece.rb"
require_relative "cursor.rb"


class Chess
  def initialize
    @board = Board.new
    @game_over = false
    @cursor = Cursor.new([0,0],@board)
    @display = Display.new(@board, @cursor)
  end

  def play_turn
    @display.render
    @cursor.get_input
  end

  def play
    until @game_over
      play_turn
    end
  end
end

Chess.new.play
