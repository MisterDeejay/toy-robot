require 'spec_helper'
require 'states/south_state'
require 'states/east_state'
require 'states/west_state'

describe SouthState do
  let(:direction) { SouthState.new }
  describe "#new" do
    it "sets the proper name" do
      expect(direction.name).to eq(SouthState::NAME)
    end
  end

  describe "#next_state_turn_left" do
    it "returns the proper direction" do
      expect(direction.next_state_turn_left).to be_an_instance_of(EastState)
    end
  end

  describe "#next_state_turn_right" do
    it "returns the proper direction" do
      expect(direction.next_state_turn_right).to be_an_instance_of(WestState)
    end
  end
end
