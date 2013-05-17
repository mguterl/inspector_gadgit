module InspectorGadgit
  module Smells
    class LinesTooLong
      def initialize(maximum_length = 72)
        @maximum_length = maximum_length
      end

      def stinks?(commit)
        commit.lines.any? { |line| line.size > @maximum_length }
      end
    end
  end
end
