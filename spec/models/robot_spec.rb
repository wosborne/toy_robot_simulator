require "./robot"

RSpec.describe Robot do
  it "initializes with default values" do
    robot = Robot.new
    expect(robot.x).to eq 0
    expect(robot.y).to eq 0
    expect(robot.direction).to eq :north
  end

  describe "#place" do
    it "places the robot at the specified coordinates and direction" do
      robot = Robot.new
      robot.place(1, 2, :east)
      expect(robot.x).to eq 1
      expect(robot.y).to eq 2
      expect(robot.direction).to eq :east
    end
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

    it "does not move if the robot is not placed" do
      robot = Robot.new(nil, nil)
      robot.move
      expect(robot.x).to eq nil
      expect(robot.y).to eq nil
    end
  end

  describe "#left" do
    it "rotates the robot to the left" do
      robot = Robot.new(0, 0, :north)
      robot.left
      expect(robot.direction).to eq :west

      robot.left
      expect(robot.direction).to eq :south

      robot.left
      expect(robot.direction).to eq :east

      robot.left
      expect(robot.direction).to eq :north
    end

    it "does not rotate if the robot is not placed" do
      robot = Robot.new(nil, nil, nil)
      robot.left
      expect(robot.direction).to be_nil
    end
  end

  describe "#right" do
    it "rotates the robot to the right" do
      robot = Robot.new(0, 0, :north)
      robot.right
      expect(robot.direction).to eq :east

      robot.right
      expect(robot.direction).to eq :south

      robot.right
      expect(robot.direction).to eq :west

      robot.right
      expect(robot.direction).to eq :north
    end

    it "does not rotate if the robot is not placed" do
      robot = Robot.new(nil, nil, nil)
      robot.right
      expect(robot.direction).to be nil
    end
  end

  describe "#report" do
    it "returns the current position and direction of the robot" do
      robot = Robot.new(1, 2, :east)
      expect(robot.report).to eq "1,2,EAST"
    end

    it "does not report if the robot is not placed" do
      robot = Robot.new(nil, nil, nil)
      expect(robot.report).to be_nil
    end
  end
end