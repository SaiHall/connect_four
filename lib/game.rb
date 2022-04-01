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

  def update_board(index, piece)
    @gameboard.sort.find do |key,value|
      if value[index] == '.'
        value[index] = piece
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

  def input
    puts "Please make your selection from A-G"
    user_input = gets.chomp.upcase
      if @gameboard[:row0].include?(user_input) && user_input.length == 1#i dont think this will accept capitalized versions of the letters?..
        update_board(@gameboard[:row0].index(user_input),"X")
      else
        puts "Invalid selection please try again!"
      end
  end

  def computer_turn
    computer = [0, 1, 2, 3, 4, 5, 6]
    comp_choice = computer.sample
      update_board(comp_choice, "O")
  end
end

connect_four = Game.new
connect_four.reset_gameboard
connect_four.input
connect_four.computer_turn
connect_four.input
connect_four.computer_turn
# connect_four.input
# connect_four.update_board(2)
# connect_four.gameboard.map {|key,value|puts value.join}
