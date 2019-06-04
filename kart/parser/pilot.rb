module Kart
  module Parser
    class Pilot < Parser::Base
      def parse
        id, name = @input.split(' – ')

        { id: id, name: name }
      end
    end
  end
end
