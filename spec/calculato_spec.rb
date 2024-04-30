require 'spec_helper'
require_relative '../calculator'

describe 'Calculator' do
  context "simple string calculation" do
    let(:str) { '"", "1", "1,5"' }
    it "return formatted request params" do
      addition = Calculator.new(str)

      expect(addition.arr_str).to eq(["", "1", "1,5"])
    end
  end
end
