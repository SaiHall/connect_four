require "./lib/welcome_message"
require "pry"
require "rspec"

RSpec.describe "Welcome message" do

  it "Exists" do
    welcome = WelcomeMessage.new
    expect(welcome).to be_an_instance_of(WelcomeMessage)
  end
end
