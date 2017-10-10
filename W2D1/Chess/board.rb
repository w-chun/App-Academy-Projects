require_relative "piece.rb"


class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8){NullPiece.new}}
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
    @grid[1].each_index {|i| self[[1 , i]] = PawnPiece.new("white")}
    @grid[6].each_index {|i| @grid[6][i] = PawnPiece.new("black")}
  end

  def start_pos(pos)
    target = self[pos]
    if target.class == NullPiece
      raise "No Piece here!"
    else
      return target
    end
  end

  def end_pos(pos)
    target = self[pos]
    if target.class != NullPiece
      raise "can't move here"
    end
  end

  def [](pos)
    x, y = pos.first, pos[1]
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos.first, pos[1]
    @grid[x][y] = value
  end
end

b = Board.new
# p b.grid.last
# p b.grid.first
