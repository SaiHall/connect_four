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

  it 'can update gameboard by index on lowest available row' do
    connect_four = Game.new
    connect_four.reset_gameboard
    connect_four.update_board(3, 'X')
    expect(connect_four.gameboard).to eq({
    row0: ["A", "B", "C", "D", "E", "F", "G"],
    row6: [".", ".", ".", ".", ".", ".", "."],
    row5: [".", ".", ".", ".", ".", ".", "."],
    row4: [".", ".", ".", ".", ".", ".", "."],
    row3: [".", ".", ".", ".", ".", ".", "."],
    row2: [".", ".", ".", ".", ".", ".", "."],
    row1: [".", ".", ".", "X", ".", ".", "."]
    })

    connect_four.update_board(3, 'X')
    expect(connect_four.gameboard).to eq({
    row0: ["A", "B", "C", "D", "E", "F", "G"],
    row6: [".", ".", ".", ".", ".", ".", "."],
    row5: [".", ".", ".", ".", ".", ".", "."],
    row4: [".", ".", ".", ".", ".", ".", "."],
    row3: [".", ".", ".", ".", ".", ".", "."],
    row2: [".", ".", ".", "X", ".", ".", "."],
    row1: [".", ".", ".", "X", ".", ".", "."]
    })
  end
  it 'will not take a choice for a full column' do
    connect_four = Game.new
    connect_four.reset_gameboard
    connect_four.update_board(3, 'X')
    connect_four.update_board(3, 'X')
    connect_four.update_board(3, 'X')
    connect_four.update_board(3, 'X')
    connect_four.update_board(3, 'X')
    connect_four.update_board(3, 'X')
    expect(connect_four.valid_choice?(3)).to eq(false)
  end
end
