class SimNode
  attr_accessor :simulation, :children

  def initialize
    @children = []
  end

  def tick
    @children.each do |child|
      child.simulation = simulation
      child.tick
    end
  end
end