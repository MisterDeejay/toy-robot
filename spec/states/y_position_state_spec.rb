require 'spec_helper'
require 'states/position_state'
require 'states/y_position_state'
require_relative '../shared_examples/positions'

describe YPositionState do
  it_behaves_like "a position"
end
