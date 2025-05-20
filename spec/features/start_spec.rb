RSpec.describe "start.rb" do
  it "runs simulation" do
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

    output = IO.popen("ruby start.rb", "r+") do |io|
      io.puts instructions.join("\n")
      io.close_write
      io.read
    end

    split_output = output.split("\n")
    expect(split_output).to eq [
      "Welcome to the Robot Simulation!",
      "0,1,NORTH",
      "0,0,WEST",
      "3,3,NORTH",
      "Exiting the simulation. Goodbye!"
    ]
  end
end