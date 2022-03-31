require './lib/game'
require "./lib/welcome_message"
require "pry"
require "rspec"

RSpec.describe 'Game' do
  it 'exists' do
    connect_four = Game.new
    expect(connect_four).to be_an_instance_of(Game)
  end

  it 'has an empty gameboard' do
    connect_four = Game.new
    expect(connect_four.gameboard).to eq({})
  end

  it 'can reset the gameboard' do
  connect_four = Game.new
  connect_four.reset_gameboard
  expect(connect_four.gameboard).to eq({
    row0: ["A", "B", "C", "D", "E", "F", "G"],
    row6: [".", ".", ".", ".", ".", ".", "."],
    row5: [".", ".", ".", ".", ".", ".", "."],
    row4: [".", ".", ".", ".", ".", ".", "."],
    row3: [".", ".", ".", ".", ".", ".", "."],
    row2: [".", ".", ".", ".", ".", ".", "."],
    row1: [".", ".", ".", ".", ".", ".", "."]
    })
  end
end
