require 'spec_helper'
require_relative '../calculator'

describe 'Calculator' do
  context "simple string calculation" do
    let(:str) { '"", "1", "1,5"' }
    it "return formatted request params" do
      addition = Calculator.new(str)

      expect(addition.arr_str).to eq(["", "1", "1,5"])
    end

    it "return addition" do
      addition = Calculator.new(str)

      expect(addition.add).to eq('0, 1, 6')
    end
  end

  context "simple string calculation for multiple data" do
    let(:str) { '"1,10,20", "1,5,20,44,50"' }
    it "return addition and formatted input" do
      addition = Calculator.new(str)

      expect(addition.arr_str).to eq(["1,10,20", "1,5,20,44,50"])
      expect(addition.add).to eq('31, 120')
    end
  end

  context "Handle \n in the input string" do
    let(:str) { '"1\n5", "1,20"' }
    it "return formatted input" do
      addition = Calculator.new(str)

      expect(addition.arr_str).to eq(["1,5", "1,20"])
    end

    it "return addition" do
      addition = Calculator.new(str)

      expect(addition.add).to eq('6, 21')
    end
  end

  context "Handle multiple \n in the input string" do
    let(:str) { '"1\n5\n15\n20", "1\n2\n3\n4\n5"' }
    it "return formatted input and addition" do
      addition = Calculator.new(str)

      expect(addition.arr_str).to eq(["1,5,15,20", "1,2,3,4,5"])
      expect(addition.add).to eq('41, 15')
    end
  end

  context "Handle delimeter in the string" do
    let(:str) { '"//:\n1:2:5", "1,2,5"' }
    it "return addition" do
      addition = Calculator.new(str)

      expect(addition.add).to eq('8, 8')
    end
  end
end
