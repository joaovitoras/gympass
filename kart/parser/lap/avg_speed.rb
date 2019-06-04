module Kart
  module Parser
    class AvgSpeed < Parser::Base
      def parse
        @input.to_f
      end
    end
  end
end
