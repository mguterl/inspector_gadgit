require 'grit'

module InspectorGadgit
  class GitRepository
    def initialize(path)
      @path = path
    end

    def repository
      @repository ||= Grit::Repo.new(@path)
    end

    def for_sha(sha)
      Commit.new repository.commits(sha).first
    end
  end
end
