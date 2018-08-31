class LeftCommand < Command
  def initialize(robot)
    super(robot)
  end

  def execute
    super
    @robot.direction = @robot.direction.next_state_turn_left
  end
end
