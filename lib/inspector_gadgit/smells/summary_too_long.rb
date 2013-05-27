module InspectorGadgit
  module Smells
    class SummaryTooLong
      def initialize(maxixmum_length = 50)
        @maxixmum_length = maxixmum_length
      end

      def stinks?(commit)
        commit.summary.size > @maxixmum_length
      end

      def description
        'Summary too long'
      end
    end
  end
end
