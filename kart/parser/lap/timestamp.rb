require 'time'

module Kart
  module Parser
    class Timestamp < Parser::Base
      def parse
        Time.parse(@input)
      rescue StandardError => _
        invalid_input
      end
    end
  end
end
