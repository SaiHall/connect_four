require 'pry'

class Game
  attr_reader :gameboard
  def initialize
    @gameboard = {}
  end

  def reset_gameboard
    @gameboard = {
      row0: ["A", "B", "C", "D", "E", "F", "G"],
      row6: [".", ".", ".", ".", ".", ".", "."],
      row5: [".", ".", ".", ".", ".", ".", "."],
      row4: [".", ".", ".", ".", ".", ".", "."],
      row3: [".", ".", ".", ".", ".", ".", "."],
      row2: [".", ".", ".", ".", ".", ".", "."],
      row1: [".", ".", ".", ".", ".", ".", "."]}
  end

  def update_board(index)
    @gameboard.sort.find do |key,value|
      if value[index] == '.'
        value[index] = 'X'
    # @gameboard = @gameboard.values[index].find do |element|
    #   element == "."
    #   element = 'X'
    #   return @gameboard
      end
    end
    print_board
  end

  def print_board #No method tests (CLI)
    gameboard.map {|key,value|puts value.join}
  end

end

# connect_four = Game.new
# connect_four.reset_gameboard
# connect_four.update_board(2)
# connect_four.gameboard.map {|key,value|puts value.join}
