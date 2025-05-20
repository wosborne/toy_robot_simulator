require 'timeout'
require './grid'
require './robot'

class Simulation
  TIMEOUT = 30
  GRID_SIZE = 5

  def initialize
    @grid = Grid.new(GRID_SIZE, GRID_SIZE)
    @robot = Robot.new(nil, nil)
  end

  def run
    puts "Welcome to the Robot Simulation!"

    loop do
      begin
        input = Timeout.timeout(TIMEOUT) { gets&.chomp }
      rescue Timeout::Error
        puts "Input timed out after #{TIMEOUT} seconds. Exiting..."
        break
      end

      break if input.nil? || input == "EXIT"

      tick(input)
    end

    puts "Exiting the simulation. Goodbye!"
  end

  private

  def tick(input)
    return if input.nil? || input.strip.empty?

    next_robot_state = @robot.clone
    command = input.split(" ")

    case command[0]
    when "PLACE"
      arguments = command[1].split(",")
      next_robot_state.place(*arguments[0..1].map(&:to_i), arguments[2].downcase.to_sym)
    when "MOVE"
      next_robot_state.move
    when "LEFT"
      next_robot_state.left
    when "RIGHT"
      next_robot_state.right
    when "REPORT"
      puts "#{next_robot_state.x},#{next_robot_state.y},#{next_robot_state.direction.upcase}" if next_robot_state.placed?
    else
      puts "Invalid command. Please try again."
    end
    
    @robot = next_robot_state if next_robot_state.placed? && @grid.valid_position?(next_robot_state.x, next_robot_state.y)
  end
end
