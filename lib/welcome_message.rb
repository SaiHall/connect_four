class WelcomeMessage
  attr_reader :greeting, :gameboard

  def initialize
    @greeting = 'Welcome to Connect Four!'
    @gameboard = {}
  end
end
