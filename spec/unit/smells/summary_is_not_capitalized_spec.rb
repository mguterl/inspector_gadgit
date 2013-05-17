require 'spec_helper'

describe InspectorGadgit::Smells::SummaryIsNotCapitalized do
  subject { smell.stinks?(commit) }
  let(:smell) { described_class.new }
  let(:commit) { double(summary: summary) }

  context 'when the summary is capitalized' do
    let(:summary) { "Hello world" }
    it { should be_false }
  end

  context 'when the summary is not capitalized' do
    let(:summary) { "hello world" }
    it { should be_true }
  end
end
