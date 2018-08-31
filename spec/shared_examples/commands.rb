require 'spec_helper'
require 'commands/command'
require 'errors/robot_simulator_error'
require 'errors/unplaced_robot_error'

shared_examples_for 'a command' do
  describe "#execute" do
    context "robot in not placed on board" do
      it "raises an UnplacedRobotError" do
        expect{ command.execute }.to raise_error(UnplacedRobotError)
      end
    end
  end
end
