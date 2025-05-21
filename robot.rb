require "./sim_node"

class Robot < SimNode
  DIRECTIONS = %w[north east south west].freeze

  attr_accessor :x, :y, :direction

  def initialize(x = 0, y = 0, direction = :north, grid = nil)
    @x = x
    @y = y
    @direction = direction
    @previous_state = nil
    @grid = grid
  end

  def tick
    @previous_state = self.clone

    perform_command(@simulation.input)
    
    validate_position
  end

  def move
    return unless placed?

    case @direction
    when :north
      @y += 1
    when :east
      @x += 1
    when :south
      @y -= 1
    when :west
      @x -= 1
    else
      raise ArgumentError, "Invalid direction: #{@direction}"
    end
  end

  def place(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def placed?
    @x && @y && @direction
  end

  def left
    rotate(:left)
  end

  def right
    rotate(:right)
  end

  def report
    "#{@x},#{@y},#{@direction.upcase}" if placed?
  end

  private

  def rotate(turn)
    return unless placed?

    current_index = DIRECTIONS.index(@direction.to_s)
    if turn == :left
      new_index = (current_index - 1) % DIRECTIONS.size
    elsif turn == :right
      new_index = (current_index + 1) % DIRECTIONS.size
    else
      raise ArgumentError, "Invalid turn: #{turn}"
    end

    @direction = DIRECTIONS[new_index].to_sym
  end

  def perform_command(input)
    command = input.split(" ")

    case command[0]
    when "PLACE"
      arguments = command[1].split(",")
      place(*arguments[0..1].map(&:to_i), arguments[2].downcase.to_sym)
    when "MOVE"
      move
    when "LEFT"
      left
    when "RIGHT"
      right
    when "REPORT"
      puts report if placed?
    end
  end

  def validate_position
    return unless placed?

    fallback_position unless @grid.within_grid?(@x, @y)
  end

  def fallback_position
    @x = @previous_state.x
    @y = @previous_state.y
    @direction = @previous_state.direction
  end
end