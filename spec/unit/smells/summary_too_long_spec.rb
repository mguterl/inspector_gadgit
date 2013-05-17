require 'spec_helper'

describe InspectorGadgit::Smells::SummaryTooLong do

  subject { smell.stinks?(commit) }
  let(:smell) { InspectorGadgit::Smells::SummaryTooLong.new maximum_length }
  let(:maximum_length) { 50 }
  let(:commit) { double(summary: summary) }
  let(:summary) { "A" * summary_length }

  context 'when the summary is under the maximum length' do
    let(:summary_length) { maximum_length - 1 }
    it { should be_false }
  end

  context 'when the summary is equal to the maximum length' do
    let(:summary_length) { maximum_length }
    it { should be_false }
  end

  context 'when the summary is greater than the maximum length' do
    let(:summary_length) { maximum_length + 1 }
    it { should be_true }
  end

end
