require 'spec_helper'
require 'direction_state_creator'
require 'states/north_state'
require 'states/west_state'
require 'states/east_state'
require 'states/south_state'

describe DirectionStateCreator do
  describe "#new" do
    describe "initialization arg" do
      context "when NorthState::NAME" do
        it "returns an instance of NorthState" do
          expect(DirectionStateCreator.new(NorthState::NAME).create).to be_an_instance_of(NorthState)
        end
      end

      context "when WestState::NAME" do
        it "returns an instance of WestState" do
          expect(DirectionStateCreator.new(WestState::NAME).create).to be_an_instance_of(WestState)
        end
      end

      context "when EastState::NAME" do
        it "returns an instance of EastState" do
          expect(DirectionStateCreator.new(EastState::NAME).create).to be_an_instance_of(EastState)
        end
      end

      context "when SouthState::NAME" do
        it "returns an instance of SouthState" do
          expect(DirectionStateCreator.new(SouthState::NAME).create).to be_an_instance_of(SouthState)
        end
      end
    end
  end
end
