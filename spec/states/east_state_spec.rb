require 'spec_helper'
require 'states/east_state'
require 'states/north_state'
require 'states/south_state'

describe EastState do
  let(:direction) { EastState.new }
  describe "#new" do
    it "sets the proper name" do
      expect(direction.name).to eq(EastState::NAME)
    end
  end

  describe "#next_state_turn_left" do
    it "returns the proper direction" do
      expect(direction.next_state_turn_left).to be_an_instance_of(NorthState)
    end
  end

  describe "#next_state_turn_right" do
    it "returns the proper direction" do
      expect(direction.next_state_turn_right).to be_an_instance_of(SouthState)
    end
  end
end
