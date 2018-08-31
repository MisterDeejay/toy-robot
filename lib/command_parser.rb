class CommandParser
  def initialize(board, robot)
    @board, @robot = board, robot
  end

  def parse(command)
    if command =~ /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
      command, x, y, direction = command.gsub(',', ' ').split

      PlaceCommand.new(@board,
                       @robot,
                       XPositionState.new(x.to_i),
                       YPositionState.new(y.to_i),
                       DirectionStateCreator.new(direction).create)
    elsif command =~ /^MOVE$/
      MoveCommand.new(@board, @robot)
    elsif command =~ /^LEFT$/
      LeftCommand.new(@robot)
    elsif command =~ /^RIGHT$/
      RightCommand.new(@robot)
    elsif command =~ /^REPORT$/
      ReportCommand.new(@robot)
    elsif command =~ /^EXIT$/
      ExitCommand.new
    elsif command =~ /^HELP$/
      HelpCommand.new
    else
      raise CommandParserError.new
    end
  end
end
