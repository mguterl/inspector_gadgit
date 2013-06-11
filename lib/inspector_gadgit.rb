require 'inspector_gadgit/version'

module InspectorGadgit

  PROJECT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  PROJECT_LIB = File.join(PROJECT_DIR, 'lib')
  PROJECT_BIN = File.join(PROJECT_DIR, 'bin')

  autoload :GitRepository, 'inspector_gadgit/git_repository'
  autoload :Commit, 'inspector_gadgit/commit'
  autoload :SHA, 'inspector_gadgit/sha'
  autoload :CLI, 'inspector_gadgit/cli'
  autoload :Inspector, 'inspector_gadgit/inspector'

  Dir["#{File.dirname(__FILE__)}/inspector_gadgit/smells/*.rb"].each { |smell| require smell }

  SMELLS = [
            Smells::SummaryTooLong.new,
            Smells::SecondLineIsNotBlank.new,
            Smells::SummaryEndsWithPeriod.new,
            Smells::SummaryIsNotCapitalized.new,
            Smells::LinesTooLong.new,
           ]

end
