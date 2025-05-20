class Robot
  DIRECTIONS = %w[north east south west].freeze

  def initialize(x = 0, y = 0, direction = :north)
    @x = x
    @y = y
    @direction = direction
  end

  attr_accessor :x, :y, :direction

  def move
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
end