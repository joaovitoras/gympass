module Kart
  module Parser
    class DurationTime < Parser::Base
      def parse
        minutes, seconds = @input.split(':').map(&:to_f)
        (minutes * 60) + seconds
      end
    end
  end
end
