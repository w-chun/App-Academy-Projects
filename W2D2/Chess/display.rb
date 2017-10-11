require "colorize"
require_relative "cursor.rb"

class Display
  def initialize(board, cursor)
    @board = board
    @cursor = cursor
  end

  def render
    @board.grid.each_with_index do |row, row_i|

      row.each_index do |col|
        value = row_i + col
        if @cursor.select_start == [row_i, col]
          print "  #{@board[[row_i,col]].value}  ".colorize(:color => :black, :background => :red)
        elsif value.even? && @cursor.cursor_pos != [row_i,col]
          print "  #{@board[[row_i,col]].value}  ".colorize(:color => :black, :background => :white)
        elsif value.even? && @cursor.cursor_pos == [row_i,col]
          print "  #{@board[[row_i,col]].value}  ".colorize(:color => :black, :background => :light_blue)
        elsif value.odd? && @cursor.cursor_pos == [row_i,col]
          print "  #{@board[[row_i,col]].value}  ".colorize(:color => :black, :background => :light_blue)
        else
          print "  #{@board[[row_i,col]].value}  ".colorize(:color => :black, :background => :yellow)
        end
      end
      puts
    end
    # print @cursor.select_start
  end
end
