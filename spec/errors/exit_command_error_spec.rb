require 'spec_helper'
require 'errors/robot_simulator_error'
require 'errors/exit_command_error'
require_relative '../shared_examples/errors'

describe ExitCommandError do
  it_behaves_like 'an error' do
    let(:message) { ExitCommandError::MESSAGE }
    let(:error) { ExitCommandError.new }
  end
end
