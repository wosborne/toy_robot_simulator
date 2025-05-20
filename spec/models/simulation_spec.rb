require "./simulation"

RSpec.describe "Simulation" do
  it "outputs users inputs and exits the simulation" do
    instructions = [
      "PLACE 0,0,NORTH"
    ]
    $stdin = StringIO.new(instructions.join("\n"))
    output = StringIO.new
    $stdout = output

    Simulation.new.run

    $stdout = STDOUT
    $stdin = STDIN

    split_results = output.string.split("\n")
    expect(split_results).eql? [
      "Welcome to the Robot Simulation!",
      "PLACE 0,0,NORTH",
    ]
  end
end