require 'spec_helper'

describe InspectorGadgit::SHA do
  def build_sha(sha)
    InspectorGadgit::SHA.new(sha)
  end

  describe 'equality' do
    subject { sha1 == sha2 }

    context 'when comparing two shas' do
      context 'when they are the same object' do
        let(:sha1) { build_sha('asdf1234') }
        let(:sha2) { sha1 }
        it { should be_true }
      end

      context 'when they have the same sha' do
        let(:sha1) { build_sha(value) }
        let(:sha2) { build_sha(value) }
        let(:value) { 'asdf1234' }
        it { should be_true }
      end

      context 'when they do not have the same sha' do
        let(:sha1) { build_sha('asdf1234') }
        let(:sha2) { build_sha('12341234') }
        it { should be_false }
      end

      context 'when the shorter string is a partial match' do
        let(:sha1) { build_sha('asdf1234') }
        let(:sha2) { build_sha('asdf12345678') }
        it { should be_true }
      end
    end

    context 'when comparing a sha with a string' do
      context 'when they have the same value' do
        let(:sha1) { build_sha(value) }
        let(:sha2) { value }
        let(:value) { 'asdf1234' }
        it { should be_true }
      end

      context 'when they have a different value' do
        let(:sha1) { build_sha('asdf1234') }
        let(:sha2) { '12341234' }
        it { should be_false }
      end

      context 'when the shorter string is a partial match' do
        let(:sha1) { build_sha('asdf1234') }
        let(:sha2) { 'asdf12345678' }
        it { should be_true }
      end
    end

    context 'when comparing a string with a sha' do
      context 'when they have the same value' do
        let(:sha1) { value }
        let(:sha2) { build_sha(value) }
        let(:value) { 'asdf1234' }
        it { should be_true }
      end

      context 'when they have a different value' do
        let(:sha1) { 'asdf1234' }
        let(:sha2) { build_sha('12341234') }
        it { should be_false }
      end

      context 'when the shorter string is a partial match' do
        let(:sha1) { 'asdf12345678' }
        let(:sha2) { build_sha('asdf1234') }
        it { should be_true }
      end
    end
  end

  describe '#to_s' do
    it 'returns the sha' do
      sha = build_sha('asdf1234')
      sha.to_s.should == 'asdf1234'
    end
  end
end
