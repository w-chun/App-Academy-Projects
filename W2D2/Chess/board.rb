require_relative "piece.rb"


class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8){NullPiece.instance}}
    @grid[0][3] = QueenPiece.new("white")
    @grid[7][3] = QueenPiece.new("black")
    @grid[0][0] = RookPiece.new("white")
    @grid[0][7] = RookPiece.new("white")
    @grid[7][7] = RookPiece.new("black")
    @grid[7][0] = RookPiece.new("black")
    @grid[0][1] = KnightPiece.new("white")
    @grid[0][6] = KnightPiece.new("white")
    @grid[7][6] = KnightPiece.new("black")
    @grid[7][1] = KnightPiece.new("black")
    @grid[0][2] = BishopPiece.new("white")
    @grid[0][5] = BishopPiece.new("white")
    @grid[7][2] = BishopPiece.new("black")
    @grid[7][5] = BishopPiece.new("black")
    @grid[0][4] = KingPiece.new("white")
    @grid[7][4] = KingPiece.new("black")
    @grid[1].each_index {|i| self[[1 , i]] = PawnPiece.new("white", [1, i])}
    @grid[6].each_index {|i| @grid[6][i] = PawnPiece.new("black", [6, i])}
  end

  # def start_pos(pos)
  #   target = self[pos]
  #   if target == NullPiece.instance
  #     raise "No Piece here!"
  #   else
  #     self[pos].selected = true
  #     return target
  #   end
  # end
  #
  # def end_pos(pos)
  #   target = self[pos]
  #   if target != NullPiece.instance
  #     raise "can't move here"
  #   end
  #
  # end

  def check_move(start_pos, end_pos)
    # p start_pos
    # puts end_pos

    if self[[start_pos[0], start_pos[1]]].valid_move?(start_pos, end_pos, self)
      self[[start_pos[0], start_pos[1]]].move(start_pos, end_pos, self)
    end
  end

  # def get_move
  #   start_p = start_pos
  # end

  def [](pos)
    x, y = pos.first, pos[1]
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos.first, pos[1]
    @grid[x][y] = value
  end
end


# p b.grid.last
# p b.grid.first
