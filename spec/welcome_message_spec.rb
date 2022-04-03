require "./lib/welcome_message"
require "pry"
require "rspec"

RSpec.describe "Welcome message" do

  it "Exists" do
    welcome = WelcomeMessage.new
    expect(welcome).to be_an_instance_of(WelcomeMessage)
  end

  it 'has a greeting' do
    welcome = WelcomeMessage.new
    expect(welcome.greeting).to eq('Welcome to Connect Four!')
  end
end

row0: ["A", "B", "C", "D", "E", "F", "G"],
row6: [".", ".", ".", ".", ".", ".", "."],
row5: [".", ".", ".", ".", ".", ".", "."],
row4: [".", ".", ".", ".", ".", ".", "."],
row3: [".", ".", ".", ".", ".", ".", "."],
row2: [".", ".", ".", ".", ".", ".", "."],
row1: [".", ".", ".", ".", ".", ".", "."]
