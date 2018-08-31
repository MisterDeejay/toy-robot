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
