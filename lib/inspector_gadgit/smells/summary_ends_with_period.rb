module InspectorGadgit
  module Smells
    class SummaryEndsWithPeriod
      def stinks?(commit)
        commit.summary.strip =~ /\.$/
      end
    end
  end
end
