class Piece
  attr_reader :value
end

class NullPiece < Piece
  def initialize
    @value = " "
  end
end

class QueenPiece < Piece
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2655"
    else
      @value = "\u265B"
    end
  end

end

class KingPiece < Piece
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2654"
    else
      @value = "\u265A"
    end
  end
end

class RookPiece < Piece
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2656"
    else
      @value = "\u265C"
    end
  end
end

class BishopPiece < Piece
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2657"
    else
      @value = "\u265D"
    end
  end
end

class KnightPiece < Piece
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2658"
    else
      @value = "\u265E"
    end
  end
end

class PawnPiece < Piece
  def initialize(team)
    @team = team
    if @team == "white"
      @value = "\u2659"
    else
      @value = "\u265F"
    end
  end
end
