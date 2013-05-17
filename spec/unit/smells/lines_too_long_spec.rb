require 'spec_helper'

describe InspectorGadgit::Smells::LinesTooLong do

  subject { smell.stinks?(commit) }
  let(:smell) { InspectorGadgit::Smells::LinesTooLong.new maximum_length }
  let(:maximum_length) { 72 }
  let(:commit) { double(lines: lines) }

  context 'with no lines over the maximum length' do
    let(:lines) { ["a" * maximum_length, "", "b" * maximum_length] }
    it { should be_false }
  end

  context 'with one line over the maximum length' do
    let(:lines) { ["a" * (maximum_length + 1), "", "b" * maximum_length] }
    it { should be_true }
  end

  context 'with multiple lines over the maixmum length' do
    let(:lines) { ["a" * (maximum_length + 1), "", "b" * (maximum_length + 1)] }
    it { should be_true }
  end

end
