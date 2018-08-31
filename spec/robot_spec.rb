require 'spec_helper'
require 'robot'
require 'states/position_state'
require 'states/x_position_state'
require 'states/y_position_state'
require 'states/north_state'

describe Robot do
  let(:robot) { Robot.new }

  describe "#new" do

    it "state is initially nil" do
      expect(robot.x_position).to be_nil
      expect(robot.y_position).to be_nil
      expect(robot.direction).to be_nil
    end

    it "state can be updated" do
      x_position, y_position, direction = XPositionState.new(0), YPositionState.new(0), NorthState.new
      robot.x_position, robot.y_position, robot.direction = x_position, y_position, direction

      expect(robot.x_position).to eq(x_position)
      expect(robot.y_position).to eq(y_position)
      expect(robot.direction).to eq(direction)
    end
  end

  describe "#has_position_and_direction?" do
    context "position or direction is nil" do
      it "return false" do
        expect(robot.has_position_and_direction?).to be_falsey
      end
    end

    context "position and direction are set" do
      it "returns true" do
        x_position, y_position, direction = XPositionState.new(0), YPositionState.new(0), NorthState.new
        robot.x_position, robot.y_position, robot.direction = x_position, y_position, direction

        expect(robot.has_position_and_direction?).to be_truthy
      end
    end
  end
end
