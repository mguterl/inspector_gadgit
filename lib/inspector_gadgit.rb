require 'inspector_gadgit/version'

module InspectorGadgit

  autoload :GitRepository, 'inspector_gadgit/git_repository'
  autoload :Commit, 'inspector_gadgit/commit'
  autoload :SHA, 'inspector_gadgit/sha'

  Dir["#{File.dirname(__FILE__)}/inspector_gadgit/smells/*.rb"].each { |smell| require smell }

  def self.new(*args)
    Inspector.for_path(*args)
  end

  SMELLS = [
            Smells::SummaryTooLong.new
           ]

  class Inspector
    def self.for_path(path)
      new GitRepository.new(path)
    end

    def initialize(repository)
      @repository = repository
      @listeners = []
    end

    def add_listener(listener)
      @listeners << listener
    end

    def analyze(sha)
      commit = @repository.for_sha(sha)
      notify_listeners(commit) if stinky?(commit)
    end

    private

    def stinky?(commit)
      SMELLS.any? { |smell| smell.stinks?(commit) }
    end

    def notify_listeners(commit)
      @listeners.each { |listener| listener.bad_commit(commit.sha) }
    end
  end

end
