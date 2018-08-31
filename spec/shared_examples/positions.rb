require 'spec_helper'
require 'states/position_state'

shared_examples_for 'a position' do
  let(:val) { 1 }
  let(:position) { described_class.new(val) }

  describe "#new" do
    it "sets the value" do
      expect(position.val).to eq(val)
    end
  end

  describe "#name" do
    it "returns a stringified version of the state" do
      expect(position.name).to eq("#{val.to_s}")
    end
  end

  describe "#next_state_move_forward" do
    let(:position) { described_class.new(val) }

    it "new instance with val += 1" do
      new_position = position.next_state_move_forward
      expect(new_position.val).to eq(val + 1)
    end
  end

  describe "#next_state_move_backward" do
    let(:position) { described_class.new(val) }

    it "new instance with val -= 1" do
      new_position = position.next_state_move_backward
      expect(new_position.val).to eq(val - 1)
    end
  end
end
