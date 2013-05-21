require 'spec_helper'

describe 'Analyzes Single Commit' do

  class TestListener
    attr_reader :bad_commits

    def initialize
      @bad_commits = []
    end

    def bad_commit(sha)
      @bad_commits << sha
    end
  end

  before { rebuild_repository }
  after { destroy_repository }

  before do
    inspector.add_listener(listener)
  end

  let(:inspector) { InspectorGadgit.new(repository_path) }
  let(:listener) { TestListener.new }

  context 'when the commit has a summary of more than 50 characters' do
    let!(:sha) {
      create_commit "a" * 51
    }

    it 'reports that this occurred' do
      inspector.analyze(sha)
      listener.bad_commits.should == [sha]
    end
  end

  context 'when the commit has a summary of 50 characters' do
    let!(:sha) {
      create_commit "a" * 50
    }

    it 'reports that this occurred' do
      inspector.analyze(sha)
      listener.bad_commits.should == []
    end
  end


end
