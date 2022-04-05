require 'rspec'
require 'pry'
# require '.lib/welcome_message'
require './lib/game'
require './lib/play'

RSpec.describe 'Play' do

  it "Exists" do
    play = Play.new
    expect(play).to be_an_instance_of(Play)
  end

  it "registers no horizontal win" do
    play = Play.new
    play.game.reset_gameboard
    gameboard = {
    row0: ["A", "B", "C", "D", "E", "F", "G"],
    row6: [".", ".", ".", ".", ".", ".", "."],
    row5: [".", ".", ".", ".", ".", ".", "."],
    row4: [".", ".", ".", ".", ".", ".", "."],
    row3: [".", ".", ".", ".", ".", ".", "."],
    row2: [".", ".", ".", ".", ".", ".", "."],
    row1: [".", ".", ".", ".", ".", ".", "."]}


    expect(play.horizontal_win?).to eq(false)
  end

  it "registers a horizontal win" do
    play = Play.new
    play.game.gameboard = {
       row0: ["A", "B", "C", "D", "E", "F", "G"],
       row6: [".", ".", ".", ".", ".", ".", "."],
       row5: [".", ".", ".", ".", ".", ".", "."],
       row4: [".", ".", ".", ".", ".", ".", "."],
       row3: [".", ".", ".", ".", ".", ".", "."],
       row2: [".", ".", ".", ".", ".", ".", "."],
       row1: ["X", "X", "X", "X", ".", ".", "."]}

    expect(play.horizontal_win?).to eq(true)

    play = Play.new
    play.game.gameboard = {
       row0: ["A", "B", "C", "D", "E", "F", "G"],
       row6: [".", ".", ".", "X", "X", "X", "X"],
       row5: [".", ".", ".", ".", ".", ".", "."],
       row4: [".", ".", ".", ".", ".", ".", "."],
       row3: [".", ".", ".", ".", ".", ".", "."],
       row2: [".", ".", ".", ".", ".", ".", "."],
       row1: [".", ".", ".", ".", ".", ".", "."]}

    expect(play.horizontal_win?).to eq(true)

    play = Play.new
    play.game.gameboard = {
       row0: ["A", "B", "C", "D", "E", "F", "G"],
       row6: [".", ".", ".", ".", ".", ".", "."],
       row5: [".", ".", ".", ".", ".", ".", "."],
       row4: [".", "X", "X", "X", "X", ".", "."],
       row3: [".", ".", ".", ".", ".", ".", "."],
       row2: [".", ".", ".", ".", ".", ".", "."],
       row1: [".", ".", ".", ".", ".", ".", "."]}

    expect(play.horizontal_win?).to eq(true)
  end

  it 'Registers horizonatal wins for O' do

    play = Play.new
    play.game.gameboard = {
       row0: ["A", "B", "C", "D", "E", "F", "G"],
       row6: [".", ".", ".", ".", ".", ".", "."],
       row5: [".", ".", ".", ".", ".", ".", "."],
       row4: [".", ".", ".", ".", ".", ".", "."],
       row3: [".", ".", ".", ".", ".", ".", "."],
       row2: [".", ".", ".", ".", ".", ".", "."],
       row1: ["O", "O", "O", "O", ".", ".", "."]}

    expect(play.horizontal_win?).to eq(true)
  end

  it 'registers no vertical win' do
    play = Play.new
    play.game.reset_gameboard
    gameboard = {
      row0: ["A", "B", "C", "D", "E", "F", "G"],
      row6: [".", ".", ".", ".", ".", ".", "."],
      row5: [".", ".", ".", ".", ".", ".", "."],
      row4: [".", ".", ".", ".", ".", ".", "."],
      row3: [".", ".", ".", ".", ".", ".", "."],
      row2: [".", ".", ".", ".", ".", ".", "."],
      row1: [".", ".", ".", ".", ".", ".", "."]}


    expect(play.vertical_win?).to eq(false)
  end
  it 'registers a vertical win on the left' do
    play = Play.new
    play.game.gameboard = {
      row0: ["A", "B", "C", "D", "E", "F", "G"],
      row6: ["X", ".", ".", ".", ".", ".", "."],
      row5: ["X", ".", ".", ".", ".", ".", "."],
      row4: ["X", ".", ".", ".", ".", ".", "."],
      row3: ["X", ".", ".", ".", ".", ".", "."],
      row2: [".", ".", ".", ".", ".", ".", "."],
      row1: [".", ".", ".", ".", ".", ".", "."]}


    expect(play.vertical_win?).to eq(true)
  end
  it 'registers a vertical win on the right' do
    play = Play.new
    play.game.gameboard = {
      row0: ["A", "B", "C", "D", "E", "F", "G"],
      row6: [".", ".", ".", ".", ".", ".", "."],
      row5: [".", ".", ".", ".", ".", ".", "."],
      row4: [".", ".", ".", ".", ".", ".", "X"],
      row3: [".", ".", ".", ".", ".", ".", "X"],
      row2: [".", ".", ".", ".", ".", ".", "X"],
      row1: [".", ".", ".", ".", ".", ".", "X"]}


    expect(play.vertical_win?).to eq(true)
  end

  it 'registers win for diagonal' do
    play = Play.new
    play.game.gameboard = {
    row0: ["A", "B", "C", "D", "E", "F", "G"],
    row6: ["X", ".", ".", ".", ".", ".", "."],
    row5: [".", "X", ".", ".", ".", ".", "."],
    row4: [".", ".", "X", ".", ".", ".", "."],
    row3: [".", ".", ".", "X", ".", ".", "."],
    row2: [".", ".", ".", ".", ".", ".", "."],
    row1: [".", ".", ".", ".", ".", ".", "."]}
    play.game.placementx = :row3
    play.game.placementy = 3

    expect(play.diagonal_win?).to eq(true)
  end

  it 'registers win for diagonal, last input not on end of 4' do
    play = Play.new
    play.game.gameboard = {
    row0: ["A", "B", "C", "D", "E", "F", "G"],
    row6: [".", ".", "X", ".", ".", ".", "."],
    row5: [".", ".", ".", "X", ".", ".", "."],
    row4: [".", ".", ".", ".", "X", ".", "."],
    row3: [".", ".", ".", ".", ".", "X", "."],
    row2: [".", ".", ".", ".", ".", ".", "."],
    row1: [".", ".", ".", ".", ".", ".", "."]}
    play.game.placementx = :row4
    play.game.placementy = 4

    expect(play.diagonal_win?).to eq(true)
  end

  it 'registers win for diagonal in other direction' do
    play = Play.new
    play.game.gameboard = {
    row0: ["A", "B", "C", "D", "E", "F", "G"],
    row6: [".", ".", ".", ".", ".", ".", "."],
    row5: [".", ".", ".", ".", ".", "X", "."],
    row4: [".", ".", ".", ".", "X", ".", "."],
    row3: [".", ".", ".", "X", ".", ".", "."],
    row2: [".", ".", "X", ".", ".", ".", "."],
    row1: [".", ".", ".", ".", ".", ".", "."]}
    play.game.placementx = :row4
    play.game.placementy = 4
    # binding.pry
    expect(play.diagonal_win?).to eq(true)
  end

  it 'registers win for diagonal in other direction' do
    play = Play.new
    play.game.gameboard = {
    row0: ["A", "B", "C", "D", "E", "F", "G"],
    row6: [".", ".", ".", "X", ".", ".", "."],
    row5: [".", ".", "X", ".", ".", ".", "."],
    row4: [".", "X", ".", ".", ".", ".", "."],
    row3: ["X", ".", ".", ".", ".", ".", "."],
    row2: [".", ".", ".", ".", ".", ".", "."],
    row1: [".", ".", ".", ".", ".", ".", "."]}
    play.game.placementx = :row4
    play.game.placementy = 1
    # binding.pry
    expect(play.diagonal_win?).to eq(true)
  end
end
