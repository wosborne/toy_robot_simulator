require 'timeout'
require './grid'
require "./sim_node"

class Simulation < SimNode
  TIMEOUT = 30
  GRID_SIZE = 5

  def initialize
    @input = nil
    @children = [Grid.new(GRID_SIZE, GRID_SIZE)]
  end

  attr_accessor :input

  def run
    puts "Welcome to the Robot Simulation!"

    loop do
      begin
        @input = Timeout.timeout(TIMEOUT) { gets&.chomp }
      rescue Timeout::Error
        puts "Input timed out after #{TIMEOUT} seconds. Exiting..."
        break
      end

      break if @input.nil? || @input == "EXIT"

      # The Simluation class is a SimNode like all other nodes.
      # This means it can have children, run the tick method and requires a simluation to reference.
      # So here we are setting the parent SimNode's simulation to the Simluation itself.
      self.simulation = self

      tick
    end

    puts "Exiting the simulation. Goodbye!"
  end
end
