require './lib/welcome_message'

welcome = WelcomeMessage.new
puts welcome.greeting
welcome.new_gameboard
welcome.gameboard.map {|key,value|puts value.join}
