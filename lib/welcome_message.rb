class WelcomeMessage
  attr_reader :greeting, :gameboard

  def initialize
    @greeting = 'Welcome to Connect Four!'
    @gameboard = {}
  end

  def new_gameboard
    @gameboard = {
      row0: ["A", "B", "C", "D", "E", "F", "G"],
      row6: [".", ".", ".", ".", ".", ".", "."],
      row5: [".", ".", ".", ".", ".", ".", "."],
      row4: [".", ".", ".", ".", ".", ".", "."],
      row3: [".", ".", ".", ".", ".", ".", "."],
      row2: [".", ".", ".", ".", ".", ".", "."],
      row1: [".", ".", ".", ".", ".", ".", "."]}
  end
end

# welcome = WelcomeMessage.new
# puts welcome.greeting
# welcome.new_gameboard
# welcome.gameboard.map {|key,value|puts value.join}
