module InspectorGadgit
  module Smells
    class SummaryEndsWithPeriod
      def stinks?(commit)
        commit.summary.strip =~ /\.$/
      end

      def description
        "Summary ends with period"
      end
    end
  end
end
