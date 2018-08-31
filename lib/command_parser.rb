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
      puts "PLACE X,Y,F     # places the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST"
      puts "MOVE            # moves the toy robot one unit forward in the direction it is currently facing"
      puts "LEFT            # rotates the robot 90 degrees counter clockwise"
      puts "RIGHT           # rotates the robot 90 degrees clockwise"
      puts "REPORT          # announces the X,Y and F of the robot"
    else
      raise CommandParserError.new
    end
  end
end
