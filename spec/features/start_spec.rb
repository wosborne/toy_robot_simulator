RSpec.describe "start.rb" do
  it "runs simulation" do
    instructions = [
      "EXIT",
    ]

    output = IO.popen("ruby start.rb", "r+") do |io|
      io.puts instructions.join("\n")
      io.close_write
      io.read
    end

    split_output = output.split("\n")
    expect(split_output).to eq [
      "Welcome to the Robot Simulation!",
      "Exiting the simulation. Goodbye!"
    ]
  end
end