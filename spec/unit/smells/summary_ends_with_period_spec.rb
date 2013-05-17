require 'spec_helper'

describe InspectorGadgit::Smells::SummaryEndsWithPeriod do
  subject { smell.stinks?(commit) }
  let(:smell) { described_class.new }
  let(:commit) { double(summary: summary) }

  context 'when the summary does not end with a period' do
    let(:summary) { "Hello world" }
    it { should be_false }
  end

  context 'when the summary ends with a period' do
    let(:summary) { "Hello world." }
    it { should be_true }
  end

  context 'when the summary ends with a period and whitespace' do
    let(:summary) { "Hello world.     " }
    it { should be_true }
  end

end
