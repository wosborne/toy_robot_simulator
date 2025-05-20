require "./grid"

RSpec.describe Grid do
  describe "#initialize" do
    it "creates a grid with the specified dimensions" do
      grid = Grid.new(5, 5)
      expect(grid.width).to eq 5
      expect(grid.height).to eq 5
    end
  end

  describe "#valid_position?" do
    it "returns true for valid positions" do
      grid = Grid.new(5, 5)
      expect(grid.valid_position?(0, 0)).to be true
      expect(grid.valid_position?(4, 4)).to be true
    end

    it "returns false for invalid positions" do
      grid = Grid.new(5, 5)
      expect(grid.valid_position?(-1, 0)).to be false
      expect(grid.valid_position?(0, -1)).to be false
      expect(grid.valid_position?(5, 0)).to be false
      expect(grid.valid_position?(0, 5)).to be false
    end
  end
end