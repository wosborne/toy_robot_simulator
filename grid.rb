require "./robot"
require "./sim_node"

class Grid < SimNode
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @children = [Robot.new(nil, nil, nil, self)]
  end

  def within_grid?(x, y)
    x >= 0 && x < @width && y >= 0 && y < @height
  end
end