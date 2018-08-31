class CommandParserError < RobotSimulatorError
  MESSAGE = "Either that command does not exist, or you "\
                                "have entered something incorrectly. For a "\
                                "list of commands, type help.".freeze

  def initialize
    super(MESSAGE)
  end
end
