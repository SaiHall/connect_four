require './lib/game'
require "./lib/welcome_message"
require "pry"
require "rspec"

RSpec.describe 'Game' do
  it 'exists' do
    connect_four = Game.new
    expect(connect_four).to be_an_instance_of(Game)
  end



end
