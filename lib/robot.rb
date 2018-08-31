class Robot
  attr_accessor :x_position, :y_position, :direction

  def has_position_and_direction?
    @x_position && @y_position && @direction
  end
end
