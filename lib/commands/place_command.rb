class PlaceCommand < Command
  INVALID_POSITION_ERROR_MESSAGE = "You cannot place me here, that position is out of bounds!".freeze

  def initialize(board, robot, x_position, y_position, direction)
    super(robot)
    @board, @x_position, @y_position, @direction = board, x_position, y_position, direction
  end

  def execute
    if @board.valid?(@x_position, @y_position)
      @robot.x_position = @x_position
      @robot.y_position = @y_position
      @robot.direction = @direction
    else
      raise InvalidPositionError.new(INVALID_POSITION_ERROR_MESSAGE)
    end
  end
end
