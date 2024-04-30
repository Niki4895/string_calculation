require 'spec_helper'
require_relative '../calculator'

describe 'Calculator' do
  context "simple string calculation" do
    let(:str) { '"", "1", "1,5"' }
    it "return addition" do
      addition = Calculator.new(str)
    end
  end
end
