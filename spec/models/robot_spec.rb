require "./robot"

RSpec.describe Robot do
  it "initializes with default values" do
    robot = Robot.new
    expect(robot.x).to eq 0
    expect(robot.y).to eq 0
    expect(robot.direction).to eq :north
  end

  describe "#move" do
    it "moves the robot in the current direction" do
      robot = Robot.new(0, 0, :north)
      robot.move
      expect(robot.x).to eq 0
      expect(robot.y).to eq 1

      robot.direction = :east
      robot.move
      expect(robot.x).to eq 1
      expect(robot.y).to eq 1

      robot.direction = :south
      robot.move
      expect(robot.x).to eq 1
      expect(robot.y).to eq 0

      robot.direction = :west
      robot.move
      expect(robot.x).to eq 0
      expect(robot.y).to eq 0
    end
  end
end