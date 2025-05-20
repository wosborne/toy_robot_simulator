RSpec.describe "start.rb" do
  it "runs simulation" do
    input = "PLACE 0,0,NORTH\nEXIT\n"

    output = IO.popen("ruby start.rb", "r+") do |io|
      io.puts input
      io.close_write
      io.read
    end

    split_output = output.split("\n")
    expect(split_output).to eq [
      "Welcome to the Robot Simulation!",
      "PLACE 0,0,NORTH",
      "Exiting the simulation. Goodbye!"
    ]
  end
end