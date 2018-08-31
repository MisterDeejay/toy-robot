require 'spec_helper'
require 'errors/robot_simulator_error'
require 'errors/command_parser_error'
require_relative '../shared_examples/errors'

describe CommandParserError do
  it_behaves_like 'an error' do
    let(:message) { CommandParserError::MESSAGE }
    let(:error) { CommandParserError.new }
  end
end
