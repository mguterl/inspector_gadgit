module InspectorGadgit
  class CLI
    def self.run(argv)
      command = argv.shift
      send(command, *argv)
    end

    def self.analyze(sha)
      inspector = Inspector.for_path(Dir.pwd)
      warnings = inspector.analyze(sha)

      print "#{sha} -- #{warnings.size} warnings"

      if warnings.size > 0
        puts ":"
      else
        puts
      end

      warnings.each do |warnings|
        puts "  #{warnings.description}"
      end
    end
  end
end
