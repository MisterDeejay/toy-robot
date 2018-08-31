class UnplacedRobotError < RobotSimulatorError
  MESSAGE = "You must place me before attempting this command!".freeze

  def initialize
    super(MESSAGE)
  end
end
