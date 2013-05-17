module InspectorGadgit
  module Smells
    class SummaryIsNotCapitalized
      def stinks?(commit)
        first_character = commit.summary[0]
        first_character != first_character.upcase
      end
    end
  end
end
