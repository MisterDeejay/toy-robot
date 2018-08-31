require 'spec_helper'
require 'errors/robot_simulator_error'
require_relative '../shared_examples/errors'

describe RobotSimulatorError do
  it_behaves_like 'an error' do
    let(:message) { "Robot Sim Error" }
    let(:error) { RobotSimulatorError.new(message) }
  end
end
