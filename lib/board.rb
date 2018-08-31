class Board
  attr_accessor :height, :width

  def initialize(height, width)
    @height, @width = height, width
  end

  def valid?(x, y)
    x.val >= 0 && x.val <= width && y.val >= 0 && y.val <= height
  end
end
