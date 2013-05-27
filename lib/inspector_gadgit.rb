require 'inspector_gadgit/version'

module InspectorGadgit

  PROJECT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  PROJECT_LIB = File.join(PROJECT_DIR, 'lib')
  PROJECT_BIN = File.join(PROJECT_DIR, 'bin')

  autoload :GitRepository, 'inspector_gadgit/git_repository'
  autoload :Commit, 'inspector_gadgit/commit'
  autoload :SHA, 'inspector_gadgit/sha'
  autoload :CLI, 'inspector_gadgit/cli'

  Dir["#{File.dirname(__FILE__)}/inspector_gadgit/smells/*.rb"].each { |smell| require smell }

  def self.new(*args)
    Inspector.for_path(*args)
  end

  SMELLS = [
            Smells::SummaryTooLong.new,
            Smells::SecondLineIsNotBlank.new,
            Smells::SummaryEndsWithPeriod.new,
            Smells::SummaryIsNotCapitalized.new,
            Smells::LinesTooLong.new,
           ]

  class Inspector
    def self.for_path(path)
      new GitRepository.new(path)
    end

    def initialize(repository)
      @repository = repository
    end

    def analyze(sha)
      commit = @repository.for_sha(sha)
      SMELLS.select { |smell| smell.stinks?(commit) }
    end
  end

end
