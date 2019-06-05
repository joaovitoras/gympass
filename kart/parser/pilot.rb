module Kart
  module Parser
    class Pilot < Parser::Base
      REGEX = /(\d{3}) – ([A-Z]\.[A-Z]+)\s/.freeze

      def parse
        data = REGEX.match(@input)
        Model::Pilot.new(id: data[1].to_i, name: data[2])
      end
    end
  end
end
