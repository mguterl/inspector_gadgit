require 'grit'

module InspectorGadgit
  class GitRepository
    DEFAULT_COMMIT_LIMIT = 100

    def initialize(path)
      @path = path
    end

    def repository
      @repository ||= Grit::Repo.new(@path)
    end

    def for_sha(sha)
      Commit.new repository.commits(sha).first
    end

    def each_commit(limit = DEFAULT_COMMIT_LIMIT)
      repository.commits('master', limit).each do |commit|
        yield Commit.new commit
      end
    end
  end
end
