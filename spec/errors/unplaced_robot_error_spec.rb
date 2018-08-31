require 'spec_helper'
require 'errors/robot_simulator_error'
require 'errors/unplaced_robot_error'
require_relative '../shared_examples/errors'

describe UnplacedRobotError do
  it_behaves_like 'an error' do
    let!(:message) { UnplacedRobotError::MESSAGE }
    let(:error) { UnplacedRobotError.new }
  end
end
