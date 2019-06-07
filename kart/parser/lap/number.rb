module Kart
  module Parser
    class Number < Parser::Base
      def parse
        Integer(@input)
      rescue StandardError => _
        invalid_input
      end
    end
  end
end
