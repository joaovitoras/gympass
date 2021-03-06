module Kart
  module Parser
    class DurationTime < Parser::Base
      def parse
        minutes, seconds = @input.split(':')
        (Float(minutes) * 60) + Float(seconds)
      rescue StandardError => _e
        invalid_input
      end
    end
  end
end
