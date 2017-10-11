require 'singleton'

class Piece
  attr_reader :value, :team

  def move(start_pos, end_pos, board)
    if valid_move?(start_pos, end_pos, board)
      board[[start_pos[0], start_pos[1]]] = NullPiece.instance
      board[[end_pos[0], end_pos[1]]] = self
    end
  end

end

# module SlidingPiece
#   def valid_move?(start_pos, end_pos, board)
#     start_row = start_pos[0]
#     start_col = start_pos[1]
#     end_row = end_pos[0]
#     end_col = end_pos[1]
#     if start_row > end_row
#       row_range = (end_row..start_row).to_a.reverse
#     else
#       row_range = (start_row..end_row).to_a
#     end
#     if start_col > end_col
#       col_range = (end_col..start_col).to_a.reverse
#     else
#       col_range = (start_col..end_col).to_a
#     end
#
#     row_range.each_index do |i|
#       next if row_range.length != 1 && (i == 0 || i == row_range.length - 1)
#       col_range.each_index do |j|
#         next if col_range.length != 1 && (j == 0 || j == col_range.length - 1)
#         return false if board[[row_range[i], col_range[j]]] != NullPiece.instance
#       end
#     end
#     return false if self.team == board[[end_pos[0], end_pos[1]]].team
#
#     true
#   end
# end

module SteppingPiece


end


class NullPiece
  attr_reader :value, :team
  include Singleton
  def initialize
    @value = " "
    @team = "NEUTRAL"
  end

  def valid_move?(_start_pos, _end_pos, board)
    false
  end
end

class QueenPiece < Piece
  # include SlidingPiece
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2655"
    else
      @value = "\u265B"
    end

  end

  def valid_move?(start_pos, end_pos, board)
    unless start_pos[0] == end_pos[0] || start_pos[1] == end_pos[1] #Bishop
      start_row = start_pos[0]
      start_col = start_pos[1]
      end_row = end_pos[0]
      end_col = end_pos[1]
      if start_row > end_row
        row_range = (end_row..start_row).to_a.reverse
      else
        row_range = (start_row..end_row).to_a
      end
      if start_col > end_col
        col_range = (end_col..start_col).to_a.reverse
      else
        col_range = (start_col..end_col).to_a
      end

      row_range.each_index do |i|
        next if row_range.length != 1 && (i == 0 || i == row_range.length - 1)
        col_range.each_index do |j|
          next if col_range.length != 1 && (j == 0 || j == col_range.length - 1)
          return false if board[[row_range[i], col_range[j]]] != NullPiece.instance
        end
      end
      puts "2nd"
      return false if self.team == board[[end_pos[0], end_pos[1]]].team
      row_difference = start_pos[0] - end_pos[0]
      col_difference = start_pos[1] - end_pos[1]
      puts "last"
      if row_difference.abs != col_difference.abs
        return false
      end

      true
    else #Rook
      start_row = start_pos[0]
      start_col = start_pos[1]
      end_row = end_pos[0]
      end_col = end_pos[1]
      if start_row > end_row
        row_range = (end_row..start_row).to_a.reverse
      else
        row_range = (start_row..end_row).to_a
      end
      if start_col > end_col
        col_range = (end_col..start_col).to_a.reverse
      else
        col_range = (start_col..end_col).to_a
      end

      row_range.each_index do |i|
        next if row_range.length != 1 && (i == 0 || i == row_range.length - 1)
        col_range.each_index do |j|
          next if col_range.length != 1 && (j == 0 || j == col_range.length - 1)
          return false if board[[row_range[i], col_range[j]]] != NullPiece.instance
        end
      end
      return false if self.team == board[[end_pos[0], end_pos[1]]].team
      if end_pos[0] != start_pos[0]
        return false if end_pos[1] != start_pos[1]
      end
      if end_pos[1] != start_pos[1]
        return false if end_pos[0] != start_pos[0]
      end
      true
    end
  end


end

class KingPiece < Piece
  MOVES = [
    [0, -1],
    [0,  1],
    [-1, 0],
    [-1, -1],
    [ 1, 0],
    [ 1,  1],
    [ 1, -1],
    [ -1,  1]
  ]
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2654"
    else
      @value = "\u265A"
    end

  end


  def valid_move?(start_pos, end_pos, board)
    MOVES.each do |move|
      new_row = move[0] + start_pos[0]
      new_col = move[1] + start_pos[1]
      if new_row == end_pos[0]
        if new_col == end_pos[1]
          return true unless board[[new_row, new_col]].team == self.team
        end
      end
    end
    false
  end

end

class RookPiece < Piece
  # include SlidingPiece
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2656"
    else
      @value = "\u265C"
    end

  end

  def valid_move?(start_pos, end_pos, board)
    start_row = start_pos[0]
    start_col = start_pos[1]
    end_row = end_pos[0]
    end_col = end_pos[1]
    if start_row > end_row
      row_range = (end_row..start_row).to_a.reverse
    else
      row_range = (start_row..end_row).to_a
    end
    if start_col > end_col
      col_range = (end_col..start_col).to_a.reverse
    else
      col_range = (start_col..end_col).to_a
    end

    row_range.each_index do |i|
      next if row_range.length != 1 && (i == 0 || i == row_range.length - 1)
      col_range.each_index do |j|
        next if col_range.length != 1 && (j == 0 || j == col_range.length - 1)
        return false if board[[row_range[i], col_range[j]]] != NullPiece.instance
      end
    end
    return false if self.team == board[[end_pos[0], end_pos[1]]].team
    if end_pos[0] != start_pos[0]
      return false if end_pos[1] != start_pos[1]
    end
    if end_pos[1] != start_pos[1]
      return false if end_pos[0] != start_pos[0]
    end
    true
  end

end

class BishopPiece < Piece
  # include SlidingPiece
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2657"
    else
      @value = "\u265D"
    end

  end

  def valid_move?(start_pos, end_pos, board)
    start_row = start_pos[0]
    start_col = start_pos[1]
    end_row = end_pos[0]
    end_col = end_pos[1]
    if start_row > end_row
      row_range = (end_row..start_row).to_a.reverse
    else
      row_range = (start_row..end_row).to_a
    end
    if start_col > end_col
      col_range = (end_col..start_col).to_a.reverse
    else
      col_range = (start_col..end_col).to_a
    end

    row_range.each_index do |i|
      next if row_range.length != 1 && (i == 0 || i == row_range.length - 1)
      col_range.each_index do |j|
        next if col_range.length != 1 && (j == 0 || j == col_range.length - 1)
        return false if board[[row_range[i], col_range[j]]] != NullPiece.instance
      end
    end
    return false if self.team == board[[end_pos[0], end_pos[1]]].team
    row_difference = start_pos[0] - end_pos[0]
    col_difference = start_pos[1] - end_pos[1]

    if row_difference.abs != col_difference.abs
      return false
    end

    true
  end

end

class KnightPiece < Piece

  MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2658"
    else
      @value = "\u265E"
    end
  end

  def valid_move?(start_pos, end_pos, board)
    MOVES.each do |move|
      new_row = move[0] + start_pos[0]
      new_col = move[1] + start_pos[1]
      if new_row == end_pos[0]
        if new_col == end_pos[1]
          return true unless board[[new_row, new_col]].team == self.team
        end
      end
    end
    false
  end

end

class PawnPiece < Piece
  def initialize(team, pos)
    @team = team
    @original_start_pos = pos
    if @team == "white"
      @value = "\u2659"
    else
      @value = "\u265F"
    end
  end

  BLACK_MOVES = [
    [-1, 0],
    [-1,  -1],
    [-1, 1],
    [-2,  0],
  ]

  WHITE_MOVES = [
    [1, 0],
    [1,  -1],
    [1, 1],
    [2,  0],
  ]

  def valid_move?(start_pos, end_pos, board)
    if @team == "white"
      WHITE_MOVES.each_with_index do |move, i|
        new_row = move[0] + start_pos[0]
        new_col = move[1] + start_pos[1]
        if new_row == end_pos[0]
          if new_col == end_pos[1]
            if i == 0
              return true if board[[new_row, new_col]] == NullPiece.instance
            elsif board[[new_row, new_col]].team == "black" && i != 3
              return true
            elsif @original_start_pos[0] == start_pos[0] && i == 3 && board[[new_row, new_col]] == NullPiece.instance
              return true
            end
          end
        end
      end
    else
      BLACK_MOVES.each_with_index do |move, i|
        new_row = move[0] + start_pos[0]
        new_col = move[1] + start_pos[1]
        if new_row == end_pos[0]
          if new_col == end_pos[1]
            if i == 0
              return true if board[[new_row, new_col]] == NullPiece.instance
            elsif board[[new_row, new_col]].team == "white" && i != 3
              return true
            elsif @original_start_pos[0] == start_pos[0] && i == 3 && board[[new_row, new_col]] == NullPiece.instance
              return true
            end
          end
        end
      end

    end
    false
  end



end
