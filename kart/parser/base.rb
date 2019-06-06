module Kart
  module Parser
    class Base
      def initialize(input)
        @input = input
      end

      def self.parse(input)
        new(input).parse
      end

      def parse
        @input = self.class::REGEX.match(@input)

        raise ArgumentError, "Invalid #{class_name} input" if @input.nil?
      end

      private

      def class_name
        self.class.name.demodulize
      end
    end
  end
end
