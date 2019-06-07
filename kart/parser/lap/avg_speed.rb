module Kart
  module Parser
    class AvgSpeed < Parser::Base
      def parse
        Float(@input.tr(',', '.'))
      rescue StandardError => _
        invalid_input
      end
    end
  end
end
