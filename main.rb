require_relative 'lib/board'
require_relative 'lib/robot'
require_relative 'lib/command_parser'
require_relative 'lib/direction_state_creator'
require_relative 'lib/commands/command'
require_relative 'lib/commands/exit_command'
require_relative 'lib/commands/left_command'
require_relative 'lib/commands/move_command'
require_relative 'lib/commands/place_command'
require_relative 'lib/commands/report_command'
require_relative 'lib/commands/right_command'
require_relative 'lib/commands/help_command'
require_relative 'lib/states/east_state'
require_relative 'lib/states/north_state'
require_relative 'lib/states/position_state'
require_relative 'lib/states/south_state'
require_relative 'lib/states/west_state'
require_relative 'lib/states/x_position_state'
require_relative 'lib/states/y_position_state'
require_relative 'lib/errors/robot_simulator_error'
require_relative 'lib/errors/command_parser_error'
require_relative 'lib/errors/exit_command_error'
require_relative 'lib/errors/invalid_position_error'
require_relative 'lib/errors/unplaced_robot_error'

board = Board.new(5, 5)
robot = Robot.new
parser = CommandParser.new(board, robot)

puts "Toy Robot Simulator 1.0 (latest) (c) 2018 Khaaliq DeJan"
puts "This simulator places a robot on a 5x5 sized table."
puts "To begin moving the robot, you must first place it"
puts "in a direction (north, south, each or west)within the"
puts "confines of the table. An example of a correct placement"
puts "would look like PLACE 3,3,NORTH because the robot in placed"
puts "within the 5x5 grid and facing north. An example of an"
puts "incorrect placement would be PLACE 6,2 because you are "
puts "attempting to place the robot on a table with a width "
puts "longer (6) than the given width of the table (5)."
puts "    help    # list of available commands"
puts "    exit    # exit simulator"

loop do
  begin
    input = gets.chomp

    command = parser.parse(input.upcase)
    command.execute
  rescue RobotSimulatorError => e
    puts e.message
    break if e.exit_error?
  end
end
