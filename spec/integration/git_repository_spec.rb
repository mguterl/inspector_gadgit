require 'spec_helper'

describe InspectorGadgit::GitRepository do

  before { rebuild_repository }
  after { destroy_repository }

  describe '#for_sha' do
    context 'when a commit exists with the specified sha' do
      subject { repository.for_sha(sha) }
      let(:repository) { InspectorGadgit::GitRepository.new(repository_path) }
      let!(:sha) { create_commit message }
      let(:message) { "This is an empty commit that helps for testing\n\nThis commit exists so that we have an easy commit to roll our\nrepository back to during testing. This commit SHA is referenced in\nour spec_helper.rb file." }

      its(:sha) { should == sha }
      its(:summary) { should == "This is an empty commit that helps for testing" }
      its(:message) { should == message }
      its(:lines) { should == message.split("\n") }
    end
  end

end
