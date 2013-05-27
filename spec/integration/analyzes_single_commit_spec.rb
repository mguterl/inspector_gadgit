require 'spec_helper'

describe 'Analyzes Single Commit' do

  def analyze_sha(sha)
    project_root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    project_lib = File.join(project_root, 'lib')
    project_bin = File.join(project_root, 'bin')

    repository_command "ruby -I#{project_lib} -S #{project_bin}/inspector_gadgit analyze #{sha}"
  end

  before { rebuild_repository }
  after { destroy_repository }

  let(:inspector) { InspectorGadgit.new(repository_path) }

  context 'when the commit has warnings' do
    let!(:sha) {
      create_commit ("a" * 51) + "\nNonblank second line\n" + ("a" * 80)
    }

    it 'reports that this occurred' do
      analyze_sha(sha).should == <<-EOM
#{sha} -- 4 warnings:
  Summary too long
  Second line is not blank
  Summary is not capitalized
  Lines over 72 characters
EOM
    end
  end

  context 'when the commit has no warnings' do
    let!(:sha) {
      create_commit "A" * 50
    }

    it 'reports that this occurred' do
      analyze_sha(sha).should == <<-EOM
#{sha} -- 0 warnings
EOM
    end
  end


end
