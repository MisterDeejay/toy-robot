class RobotSimulatorError < StandardError
  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def exit_error?
    false
  end
end
