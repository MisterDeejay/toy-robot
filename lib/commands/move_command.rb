class MoveCommand < Command
  INVALID_POSITION_ERROR_MESSAGE = "I cannot move in this direction!".freeze
  def initialize(board, robot)
    super(robot)
    @board = board
  end

  def execute
    super
    x_position, y_position = update_positions
    if @board.valid?(x_position, y_position)
      update_robot_position_state(x_position, y_position)
    else
      raise InvalidPositionError.new(INVALID_POSITION_ERROR_MESSAGE)
    end
  end

  private

  def update_positions
    x, y = @robot.x_position, @robot.y_position
    if @robot.direction.name == NorthState::NAME
      y = @robot.y_position.next_state_move_forward
    elsif @robot.direction.name == SouthState::NAME
      y = @robot.y_position.next_state_move_backward
    elsif @robot.direction.name == EastState::NAME
      x = @robot.x_position.next_state_move_forward
    elsif @robot.direction.name == WestState::NAME
      x = @robot.x_position.next_state_move_backward
    end

    [x, y]
  end

  def update_robot_position_state(x_position, y_position)
    @robot.x_position = x_position
    @robot.y_position = y_position
  end
end
