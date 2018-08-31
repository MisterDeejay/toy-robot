require 'spec_helper'
require 'board'
require 'states/position_state'
require 'states/x_position_state'
require 'states/y_position_state'

describe Board do
  let(:board) { Board.new(5, 5) }

  describe "#valid?" do
    context "with a position that lies on the board" do
      let(:x_position) { XPositionState.new(1)}
      let(:y_position) { YPositionState.new(1)}

      it "returns true" do
        expect(board.valid?(x_position, y_position)).to be_truthy
      end
    end

    context "with position that does not lie on the board" do
      let(:x_position) { XPositionState.new(6) }
      let(:y_position) { YPositionState.new(2) }
      it "returns false" do
        expect(board.valid?(x_position, y_position)).to be_falsey
      end
    end
  end
end
