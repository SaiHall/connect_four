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
    expect(welcome.greeting).to eq('Welcome to Connect Four! Sai and Parker hope you enjoy your stay.')
  end
end
