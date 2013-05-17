module InspectorGadgit
  class Commit
    def initialize(commit)
      @commit = commit
    end

    def summary
      lines.first
    end

    def lines
      @lines ||= message.split("\n")
    end

    def sha
      SHA.new @commit.sha
    end

    def method_missing(meth, *args, &block)
      @commit.send(meth, *args, &block)
    end
  end
end
