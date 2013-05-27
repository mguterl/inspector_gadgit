require 'spec_helper'

describe 'Analyzes Single Commit' do

  def analyze_sha(sha)
    repository_command "ruby -I#{InspectorGadgit::PROJECT_LIB} -S #{InspectorGadgit::PROJECT_BIN}/inspector_gadgit analyze #{sha}"
  end

  before { rebuild_repository }
  after { destroy_repository }

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
