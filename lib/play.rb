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
end
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




# play = Play.new
# play.play
