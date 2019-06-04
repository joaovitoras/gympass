module Kart
  module Parser
    class Base
      def initialize(input)
        @input = input
      end

      def self.parse(input)
        new(input).parse
      end
    end
  end
end
