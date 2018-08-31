require 'spec_helper'
require 'states/position_state'
require 'states/x_position_state'
require_relative '../shared_examples/positions'

describe XPositionState do
  it_behaves_like "a position"
end
