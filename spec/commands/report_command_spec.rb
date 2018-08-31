require 'spec_helper'
require 'robot'
require 'commands/command'
require 'commands/report_command'
require 'states/position_state'
require 'states/x_position_state'
require 'states/y_position_state'
require 'states/north_state'
require_relative '../shared_examples/commands'

describe ReportCommand do
  it_behaves_like 'a command' do
    let(:robot) { Robot.new }
    let(:command) { ReportCommand.new(robot) }

    context "when robot is placed" do
      before do
        robot.x_position = XPositionState.new(0)
        robot.y_position = YPositionState.new(0)
        robot.direction = NorthState.new
      end

      it "returns output string of robot's location" do
        output = "# Output: #{robot.x_position.name},#{robot.y_position.name},#{robot.direction.name}"
        expect(STDOUT).to receive(:puts).with(output)

        command.execute
      end
    end
  end
end
