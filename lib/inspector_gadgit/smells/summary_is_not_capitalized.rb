module InspectorGadgit
  module Smells
    class SummaryIsNotCapitalized
      def stinks?(commit)
        first_character = commit.summary[0]
        first_character != first_character.upcase
      end

      def description
        "Summary is not capitalized"
      end
    end
  end
end
