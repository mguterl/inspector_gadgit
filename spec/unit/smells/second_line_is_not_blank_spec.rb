require 'spec_helper'

describe InspectorGadgit::Smells::SecondLineIsNotBlank do

  subject { smell.stinks?(commit) }
  let(:smell) { described_class.new }
  let(:commit) { double(lines: lines) }

  context 'when there is no second line' do
    let(:lines) { ["a"] }
    it { should be_false }
  end

  context 'when the second line is blank' do
    let(:lines) { ["a", "  ", "a"] }
    it { should be_false }
  end

  context 'when the second line is not blank' do
    let(:lines) { ["a", "a", "", "a"] }
    it { should be_true }
  end

end
