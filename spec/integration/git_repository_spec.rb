require 'spec_helper'

describe InspectorGadgit::GitRepository do

  before { rebuild_repository }
  after { destroy_repository }

  let(:repository) { InspectorGadgit::GitRepository.new(repository_path) }

  describe '#for_sha' do
    context 'when a commit exists with the specified sha' do
      subject { repository.for_sha(sha) }
      let!(:sha) { create_commit message }
      let(:message) { "This is an empty commit that helps for testing\n\nThis commit exists so that we have an easy commit to roll our\nrepository back to during testing. This commit SHA is referenced in\nour spec_helper.rb file." }

      its(:sha) { should == sha }
      its(:summary) { should == "This is an empty commit that helps for testing" }
      its(:message) { should == message }
      its(:lines) { should == message.split("\n") }
    end
  end

  describe '#each_commit' do
    let(:yielded) { [] }

    context 'when there are no commits in the repository' do
      it 'yields nothing' do
        repository.each_commit { |commit| yielded << commit }
        yielded.should == []
      end
    end

    context 'when there are commits in the repository' do
      let!(:sha) { create_commit }

      it 'yields each commit' do
        repository.each_commit { |commit| yielded << commit }
        yielded.size.should == 1

        yielded.first.sha.should == sha
      end
    end

    context 'when a commit limit is specified' do
      let!(:shas) { [create_commit, create_commit] }

      it 'limits the number of commits yielded' do
        repository.each_commit(1) { |commit| yielded << commit }
        yielded.size.should == 1
      end

      it 'yields the most recent commits first' do
        repository.each_commit(1) { |commit| yielded << commit }
        yielded[0].sha.should == shas.last
      end
    end
  end

end
