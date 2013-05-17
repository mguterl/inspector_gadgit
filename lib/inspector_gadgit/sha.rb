# This is largely an experiment and may not be required for production.
module InspectorGadgit
  class SHA
    def initialize(sha)
      @sha = sha
    end

    def to_s
      @sha
    end

    alias_method :to_str, :to_s

    def ==(other)
      shas = [to_s, other.to_s]
      min = shas.min
      max = shas.max

      max[0..min.size-1] == min
    end
  end
end
