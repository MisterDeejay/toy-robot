require 'spec_helper'
require 'commands/command'
require 'commands/exit_command'
require 'errors/robot_simulator_error'
require 'errors/exit_command_error'

describe ExitCommand do
  let(:command) { ExitCommand.new }

  describe "#execute" do
    it "raises an ExitCommandError" do
      expect{ command.execute }.to raise_error(ExitCommandError)
    end
  end
end
