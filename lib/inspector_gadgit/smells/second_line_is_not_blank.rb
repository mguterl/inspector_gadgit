module InspectorGadgit
  module Smells
    class SecondLineIsNotBlank
      def stinks?(commit)
        second_line = commit.lines[1].to_s
        second_line.strip.size > 0
      end

      def description
        "Second line is not blank"
      end
    end
  end
end
