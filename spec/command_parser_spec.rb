require 'spec_helper'
require 'board'
require 'robot'
require 'command_parser'
require 'commands/command'
require 'commands/place_command'
require 'commands/move_command'
require 'commands/left_command'
require 'commands/right_command'
require 'commands/report_command'
require 'commands/exit_command'
require 'direction_state_creator'
require 'states/position_state'
require 'states/x_position_state'
require 'states/y_position_state'
require 'states/north_state'
require 'errors/robot_simulator_error'
require 'errors/command_parser_error'

describe CommandParser do
  describe "#parse" do
    let(:board) { Board.new(5, 5) }
    let(:robot) { Robot.new }
    let(:parser) { CommandParser.new(board, robot) }

    context "PLACE command" do
      let(:input) { "PLACE 0,0,NORTH" }

      it "instantiates and returns a PlaceCommand object -- passing the board and robot as args" do
        allow(PlaceCommand).to receive(:new).and_call_original
        expect(PlaceCommand).to receive(:new).with(board, robot, any_args)
        command = parser.parse(input)

        expect(command.is_a?(PlaceCommand)).to be_truthy
      end

      it "instantiates a position object to pass to PlaceCommand object as an arg" do
        expect(XPositionState).to receive(:new).with(0)
        expect(YPositionState).to receive(:new).with(0)
        parser.parse(input)
      end
    end

    context "MOVE command" do
      let(:input) { "MOVE" }

      it "instantiates and returns a MoveCommand object -- passing the board and robot as args" do
        allow(MoveCommand).to receive(:new).and_call_original
        expect(MoveCommand).to receive(:new).with(board, robot)
        command = parser.parse(input)

        expect(command.is_a?(MoveCommand)).to be_truthy
      end
    end

    context "LEFT command" do
      let(:input) { "LEFT" }

      it "instantiates and returns a LeftCommand object -- passing the robot as an arg" do
        allow(LeftCommand).to receive(:new).and_call_original
        expect(LeftCommand).to receive(:new).with(robot)
        command = parser.parse(input)

        expect(command.is_a?(LeftCommand)).to be_truthy
      end
    end

    context "RIGHT command" do
      let(:input) { "RIGHT" }

      it "instantiates and returns a RightCommand object -- passing the robot as an arg" do
        allow(RightCommand).to receive(:new).and_call_original
        expect(RightCommand).to receive(:new).with(robot)
        command = parser.parse(input)

        expect(command.is_a?(RightCommand)).to be_truthy
      end
    end

    context "REPORT command" do
      let(:input) { "REPORT" }

      it "instantiates and returns a ReportCommand object -- passing the robot as an arg" do
        allow(ReportCommand).to receive(:new).and_call_original
        expect(ReportCommand).to receive(:new).with(robot)
        command = parser.parse(input)

        expect(command.is_a?(ReportCommand)).to be_truthy
      end
    end

    context "EXIT command" do
      let(:input) { "EXIT" }

      it "instantiates and returns a ExitCommand object" do
        command = parser.parse(input)

        expect(command.is_a?(ExitCommand)).to be_truthy
      end
    end

    context "given a command that does not exist" do
      let(:input) { "SOME RANDOM COMMAND" }

      it "raises a CommandParserError" do
        expect{ parser.parse(input) }.to raise_error(CommandParserError)
      end
    end
  end
end
