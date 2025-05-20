require "./simulation"

RSpec.describe "Simulation" do
  describe "run" do
    it "performs user inputs on the robot" do
      instructions = [
        "PLACE 0,0,NORTH",
        "MOVE",
        "REPORT",
        "PLACE 0,0,NORTH",
        "LEFT",
        "REPORT",
        "PLACE 1,2,EAST",
        "MOVE",
        "MOVE",
        "LEFT",
        "MOVE",
        "REPORT"
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
        "0,0,WEST",
        "3,3,NORTH",
        "Exiting the simulation. Goodbye!"
      ]
    end

    it "only peforms commands following the first PLACE commands" do
      instructions = [
        "MOVE",
        "REPORT",
        "LEFT",
        "REPORT",
        "MOVE",
        "MOVE",
        "LEFT",
        "PLACE 2,2,EAST",
        "MOVE",
        "REPORT"
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
        "3,2,EAST",
        "Exiting the simulation. Goodbye!"
      ]
    end

    it "prevents the robot from falling off the grid" do
      instructions = [
        "PLACE 4,4,NORTH",
        "MOVE",
        "REPORT",
        "PLACE 4,4,EAST",
        "MOVE",
        "REPORT",
        "PLACE 0,0,SOUTH",
        "MOVE",
        "REPORT",
        "PLACE 0,0,WEST",
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
        "4,4,NORTH",
        "4,4,EAST",
        "0,0,SOUTH",
        "0,0,WEST",
        "Exiting the simulation. Goodbye!"
      ]
    end
  end
end