class Command
  def initialize(robot)
    @robot = robot
  end

  def execute
    raise UnplacedRobotError unless @robot.has_position_and_direction?
  end
end
