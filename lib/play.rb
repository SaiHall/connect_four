require "./lib/welcome_message"
require "./lib/game"
require "pry"


class Play

  attr_reader :game
  def initialize
    @game = Game.new
  end

  def play
    welcome = WelcomeMessage.new
    puts welcome.greeting
    @game.reset_gameboard
    @game.print_board
    21.times{@game.input
    @game.computer_turn}
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
  # binding.pry
  def diagonal_up_right?
    @diag_array = []
    n = @game.placementx[-1].to_i#should show row number only
    y = @game.placementy
    4.times do
      key = ("row" + "#{n}").to_sym  #up a row over and index
      @diag_array << @game.gameboard[key][y]
      n += 1
      y += 1#n + 1 n - 1 translated into a row?
      if diag_array == ["X", "X", "X", "X"]
        return true
      elsif diag_array == ["O", "O", "O", "O"]
        return true
      end
    end
    return false
  end



  def diagonal_down_left?
    @diag_array = []
    n = @game.placementx[-1].to_i
    y = @game.placementy
    4.times do
      key = ("row" + "#{n}").to_sym
      @diag_array << @game.gameboard[key][y]
      n -= 1
      y -= 1
      if diag_array == ["X", "X", "X", "X"]
        return true
      elsif diag_array == ["O", "O", "O", "O"]
        return true
      end
    end
    return false
  end

  def diag_down_right?
    @diag_array = []
    n = @game.placementx[-1].to_i
    y = @game.placementy
    4.times do
      key = ("row" + "#{n}").to_sym
      @diag_array << @game.gameboard[key][y]
      n -= 1
      y += 1
      if diag_array == ["X", "X", "X", "X"]
        return true
      elsif diag_array == ["O", "O", "O", "O"]
        return true
      end
    end
    return false
  end

  def diag_up_left?
    @diag_array = []
    n = @game.placementx[-1].to_i
    y = @game.placementy
    4.times do
      key = ("row" + "#{n}").to_sym
      @diag_array << @game.gameboard[key][y]
      n += 1
      y -= 1
      if diag_array == ["X", "X", "X", "X"]
        return true
      elsif diag_array == ["O", "O", "O", "O"]
        return true
      end
    end
    return false
  end

end
play = Play.new
play.game.gameboard = {
  row0: ["A", "B", "C", "D", "E", "F", "G"],
  row6: [".", ".", ".", ".", ".", ".", "."],
  row5: [".", ".", ".", ".", ".", ".", "."],
  row4: ["S", ".", ".", ".", ".", ".", "K"],
  row3: [".", "L", ".", ".", ".", "R", "."],
  row2: [".", ".", "P", ".", "W", ".", "."],
  row1: [".", ".", ".", ".", ".", ".", "."]}
play.game.input
play.diagonal_down_left?
#   # puts Matrix.rows(play.game.gameboard.values).each(:diagonal).to_a
# array = play.game.gameboard.values.transpose
# diag = []
# (0..6).collect{|i| diag << array[i][i - 1]}
#
# puts diag
# # (0..6).collect{|i| puts array[i][i + 1]}
# # (0..6).collect{|i| puts array[i][i]}
#   # play.game.gameboard.each_value do |value|
  #   n = 0
  #   puts value[n + 1]
  # end
# # # # binding.pry
# play.vertical_win?
    # if
    #   @game.gameboard.keys.each_cons(4) do |value|
    #     value.any?(["X", "X", "X", "X"])
    #   end
    # else
    #   return false
    # end
     # @game.gameboard.find do |key,value|
      # if value.each_with_object(["X", "X", "X", "X"])
      #   return true
      # else
      #   return false
    # @game.gameboard.each_with_object

    # @gameboard.any?{ |piece| 4.times piece}

    # def vertical_win?
    #   samp_index = 0
    #   win_array = []
    #   @game.gameboard.each do |key,value|
    #     win_array << value[samp_index]
    #     win_array.each_cons(4) do |element|
    #       if element == ["X", "X", "X", "X"]
    #         return true
    #       elsif element == ["O", "O", "O", "O"]
    #         return true
    #       end
    #     end
    #     puts win_array
    #   end
    #   if samp_index < 6
    #     samp_index += 1
    #   else
    #     return false
    #   end
    # end

    #def horizontal_win
    # array = @game.gameboard.values.transpose
    # diag = []
    # (0..6).collect{|i| diag << array[i][i + 1]}
    #   diag.each_cons(4) do |element|
    #     if element == ["X", "X", "X", "X"]
    #       return true
    #     elsif element == ["O", "O", "O", "O"]
    #       return true
    #     end
    #   end#Figure out how to see whole board/make diag a method with integer arguement
    #     (0..6).collect{|i| diag << array[i][i - 1]}
    #       diag.each_cons(4) do |element|
    #         if element == ["X", "X", "X", "X"]
    #           return true
    #         elsif element == ["O", "O", "O", "O"]
    #           # return true
    #         end
    #   end
    # return false
    # end



# play = Play.new
# play.play
# play = Play.new
# play.game.reset_gameboard
# play.game.input
# puts play.game.placement
