require 'pry'
require './lib/welcome_message'

class Game
  attr_reader :gameboard, :placementx, :placementy, :last_piece
  attr_accessor :gameboard, :placementx, :placementy, :last_piece
  def initialize
    @gameboard = {}
    @placementx
    @placementy
    @last_piece
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
    if !valid_choice?(index)
      return invalid_choice
    end
    @gameboard.sort.find do |key,value|
      if value[index] == '.'
        value[index] = piece
        @placementx = key
        @placementy = index
        @last_piece = piece
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
        invalid_choice
      end
  end

  def computer_turn
    computer = [0, 1, 2, 3, 4, 5, 6]
    comp_choice = computer.sample
    until valid_choice?(comp_choice)
      comp_choice = computer.sample
    end
    update_board(comp_choice, "O")
  end

  def invalid_choice
    puts "Choice not valid."
    input
  end

  def valid_choice?(index)
    if @gameboard[:row6][index] == '.'
      return true
    else
      return false
    end
  end

  def play_or_c
    if @last_piece == "X"
      return "Player"
    elsif @last_piece == "O"
      return "Computer"
    end
  end
end
