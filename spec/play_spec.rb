require 'rspec'
require 'pry'
# require '.lib/welcome_message'
require './lib/game'
require './lib/play'

RSpec.describe 'Play' do

  xit "Exists" do
    play = Play.new
    expect(play).to be_an_instance_of(Play)
  end

  xit "registers no horizontal win" do
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

  xit "registers a horizontal win" do
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

  xit 'Registers horizonatal wins for O' do

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

  xit 'registers no vertical win' do
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
  xit 'registers a vertical win on the left' do
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
end
