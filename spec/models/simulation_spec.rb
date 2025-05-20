require "./simulation"

RSpec.describe "Simulation" do
  describe "run" do
    it "performs user inputs on the robot" do
      instructions = [
        "PLACE 0,0,NORTH",
        "MOVE",
        "REPORT",
      ]
      $stdin = StringIO.new(instructions.join("\n"))
      output = StringIO.new
      $stdout = output

      Simulation.new.run

      $stdout = STDOUT
      $stdin = STDIN

      split_results = output.string.split("\n")
      expect(split_results).to eq [
        "Welcome to the Robot Simulation!",
        "0,1,NORTH",
        "Exiting the simulation. Goodbye!",
      ]
    end
  end
end