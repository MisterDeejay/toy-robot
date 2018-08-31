require 'spec_helper'

shared_examples_for 'an error' do
  describe "#new" do
    it "sets the proper error message" do
      expect(error.message).to eq(message)
    end
  end
end
