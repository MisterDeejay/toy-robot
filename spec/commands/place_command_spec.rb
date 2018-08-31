require 'spec_helper'
require 'board'
require 'robot'
require 'commands/command'
require 'commands/place_command'
require 'states/north_state'
require 'states/south_state'
require 'states/position_state'
require 'states/x_position_state'
require 'states/y_position_state'
require 'errors/robot_simulator_error'
require 'errors/invalid_position_error'

describe PlaceCommand do
  let(:board) { Board.new(5, 5) }
  let(:robot) { Robot.new }
  let(:direction) { NorthState.new }
  let(:command) { PlaceCommand.new(board, robot, x_position, y_position, direction) }

  describe "#execute" do
    context "with a valid position state" do
      let(:x_position) { XPositionState.new(0) }
      let(:y_position) { YPositionState.new(0) }
      let(:direction) { SouthState.new }

      it "sets the position and direction of the robot" do
        command.execute

        expect(robot.x_position).to eq(x_position)
        expect(robot.y_position).to eq(y_position)
        expect(robot.direction).to be_an_instance_of(SouthState)
      end
    end

    context "with a invalid position state" do
      let(:x_position) { XPositionState.new(10) }
      let(:y_position) { YPositionState.new(30) }

      it "raises an invalid position error" do
        expect{ command.execute }.to raise_error(InvalidPositionError)
      end
    end
  end
end
