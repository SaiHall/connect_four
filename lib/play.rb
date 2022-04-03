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
    # binding.pry
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
end
# play = Play.new
# play.game.gameboard = {
#   row0: ["A", "B", "C", "D", "E", "F", "G"],
#   row6: ["X", ".", ".", ".", ".", ".", "."],
#   row5: ["X", ".", ".", ".", ".", ".", "."],
#   row4: ["X", ".", ".", ".", ".", ".", "."],
#   row3: ["X", ".", ".", ".", ".", ".", "."],
#   row2: [".", ".", ".", ".", ".", ".", "."],
#   row1: [".", ".", ".", ".", ".", ".", "."]}
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




# play = Play.new
# play.play
