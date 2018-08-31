require 'spec_helper'
require 'robot'
require_relative '../shared_examples/commands'

describe Command do
  it_behaves_like 'a command' do
    let(:robot) { Robot.new }
    let(:command) { described_class.new(robot) }
  end
end
