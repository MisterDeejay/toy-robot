class HelpCommand < Command
  def initialize
  end

  def execute
    puts "PLACE X,Y,F     # places the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST"
    puts "MOVE            # moves the toy robot one unit forward in the direction it is currently facing"
    puts "LEFT            # rotates the robot 90 degrees counter clockwise"
    puts "RIGHT           # rotates the robot 90 degrees clockwise"
    puts "REPORT          # announces the X,Y and F of the robot"
  end
end
