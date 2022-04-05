require "./lib/welcome_message"
require "./lib/game"
require "pry"


class Play

  attr_reader :game
  def initialize
    @game = Game.new
  end

  def start
    welcome = WelcomeMessage.new
    puts welcome.greeting
    @game.reset_gameboard
    @game.print_board
    puts "Enter 'p' to play. Enter 'q' to quit."
    answer = gets.chomp
    if answer == "p"
      loopdy_doo
    elsif answer == "q"
      puts "Quitting......"
      exit
    else
      puts "That was not a valid choice, NO GAME FOR YOU!"
    end
  end

  def horizontal_win?
    @game.gameboard.each do |key,value|
      value.each_cons(4) do |element|
        if element == ["X", "X", "X", "X"]
          return true
        elsif element == ["O", "O", "O", "O"]
          return true
        end
      end
    end
    return false
  end

  def vertical_win?
    vert_pattern = @game.gameboard.values.transpose
    vert_pattern.each do |index1|
      index1.each_cons(4) do |element|
        if element == ["X", "X", "X", "X"]
          return true
        elsif element == ["O", "O", "O", "O"]
          return true
        end
      end
    end
    return false
  end

  def diag_left_up
    @diag_array = []
    @x = @game.placementx[-1].to_i
    @y = @game.placementy
    until @x == 7 || @y == 7 do
      key = ("row" + "#{@x}").to_sym
      @diag_array << @game.gameboard[key][@y]
      @x += 1
      @y += 1
    end
    @diag_array.delete_at(0)
    return @diag_array
  end

  def diag_left_down
    @diag_array = []
    @x = @game.placementx[-1].to_i
    @y = @game.placementy
    until @x == 0 || @y == -1 do
      key = ("row" + "#{@x}").to_sym
      @diag_array << @game.gameboard[key][@y]
      @x -= 1
      @y -= 1
    end
    return @diag_array
  end

  def diag_right_up
    @diag_array = []
    @x = @game.placementx[-1].to_i
    @y = @game.placementy
    until @x == 0 || @y == 7 do
      key = ("row" + "#{@x}").to_sym
      @diag_array << @game.gameboard[key][@y]
      @x -= 1
      @y += 1
    end
    return @diag_array
  end

  def diag_right_down
    @diag_array = []
    @x = @game.placementx[-1].to_i
    @y = @game.placementy
    until @x == 7 || @y == -1 do
      key = ("row" + "#{@x}").to_sym
      @diag_array << @game.gameboard[key][@y]
      @x += 1
      @y -= 1
    end
    @diag_array.delete_at(0)
    return @diag_array
  end

  def diagonal_win?
    left = [diag_left_up.reverse, diag_left_down].flatten
    right = [diag_right_down, diag_right_up].flatten
    left.each_cons(4) do |element|
      if element == ["X", "X", "X", "X"]
        return true
      elsif element == ["O", "O", "O", "O"]
        return true
      end
    end
    right.each_cons(4) do |element|
      if element == ["X", "X", "X", "X"]
        return true
      elsif element == ["O", "O", "O", "O"]
        return true
      end
    end
    return false
  end

  def draw?
    if @game.gameboard[:row6].include?(".")
      return false
    else
      return true
    end
  end

  def end?
    if horizontal_win?
      puts "Horizonatal Winner!"
      start
    elsif vertical_win?
      puts "Vertical Winner!"
      start
    elsif diagonal_win?
      puts "Diagon alley Winner!"
      start
    elsif draw?
      puts "Professor T. would NEVER!"
      start
    else
      return false
    end
  end

  def loopdy_doo
    4.times do
      @game.input
      @game.computer_turn
    end
    until end?
      @game.input
      end?
      @game.computer_turn
    end
  end

end
play = Play.new
play.start
# play.game.gameboard = {
#   row0: ["A", "B", "C", "D", "E", "F", "G"],
#   row6: [".", ".", ".", ".", ".", ".", "."],
#   row5: [".", ".", ".", ".", ".", ".", "."],
#   row4: ["S", ".", ".", ".", ".", ".", "K"],
#   row3: [".", "L", ".", ".", ".", "R", "."],
#   row2: [".", ".", "P", ".", "W", ".", "."],
#   row1: [".", ".", ".", ".", ".", ".", "."]}
# play.game.input
# play.diagonal_down_left?
