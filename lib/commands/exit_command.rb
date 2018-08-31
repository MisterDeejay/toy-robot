class ExitCommand < Command
  def initialize
  end

  def execute
    raise ExitCommandError.new
  end
end
