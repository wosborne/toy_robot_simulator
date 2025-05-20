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

  def left
    rotate(:left)
  end

  def right
    rotate(:right)
  end

  private

  def rotate(turn)
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
end