class ExitCommandError < RobotSimulatorError
  MESSAGE = "Exiting the Toy Robot Simulator...goodbye!".freeze

  def initialize
    super(MESSAGE)
  end

  def exit_error?
    true
  end
end
