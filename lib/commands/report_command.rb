class ReportCommand < Command
  def initialize(robot)
    super(robot)
  end

  def execute
    super
    puts "# Output: #{@robot.x_position.name},#{@robot.y_position.name},#{@robot.direction.name}"
  end
end
