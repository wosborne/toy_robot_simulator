class Grid
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def valid_position?(x, y)
    x >= 0 && x < @width && y >= 0 && y < @height
  end
end