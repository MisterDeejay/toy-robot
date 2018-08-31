require 'spec_helper'
require 'errors/robot_simulator_error'
require 'errors/invalid_position_error'
require_relative '../shared_examples/errors'

describe InvalidPositionError do
  it_behaves_like 'an error' do
    let!(:message) { "Invalid Position!" }
    let(:error) { InvalidPositionError.new(message) }
  end
end
