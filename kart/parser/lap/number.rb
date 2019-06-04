module Kart
  module Parser
    class Number < Parser::Base
      def parse
        @input.to_i
      end
    end
  end
end
