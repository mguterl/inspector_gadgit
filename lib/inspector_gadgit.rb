require 'inspector_gadgit/version'
require 'inspector_gadgit/git_repository'
require 'inspector_gadgit/commit'
require 'inspector_gadgit/sha'
require 'inspector_gadgit/cli'
require 'inspector_gadgit/inspector'

module InspectorGadgit

  PROJECT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  PROJECT_LIB = File.join(PROJECT_DIR, 'lib')
  PROJECT_BIN = File.join(PROJECT_DIR, 'bin')

  Dir["#{File.dirname(__FILE__)}/inspector_gadgit/smells/*.rb"].each { |smell| require smell }

  SMELLS = [
            Smells::SummaryTooLong.new,
            Smells::SecondLineIsNotBlank.new,
            Smells::SummaryEndsWithPeriod.new,
            Smells::SummaryIsNotCapitalized.new,
            Smells::LinesTooLong.new,
           ]

end
