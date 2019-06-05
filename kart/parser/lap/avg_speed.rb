module Kart
  module Parser
    class AvgSpeed < Parser::Base
      def parse
        @input.tr(',', '.').to_f
      end
    end
  end
end
