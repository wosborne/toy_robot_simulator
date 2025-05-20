require 'timeout'

class Simulation
  TIMEOUT = 10

  def initialize
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
    end

    puts "Exiting the simulation. Goodbye!"
  end
end
