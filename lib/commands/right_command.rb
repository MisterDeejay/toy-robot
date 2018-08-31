class RightCommand < Command
  def initialize(robot)
    super(robot)
  end

  def execute
    super
    @robot.direction = @robot.direction.next_state_turn_right
  end
end
