require 'time'

module Kart
  module Parser
    class Timestamp < Parser::Base
      def parse
        Time.parse(@input)
      end
    end
  end
end
