module Kart
  module Parser
    class Pilot < Parser::Base
      REGEX = /(\d{3}) – ([A-Z]\.[A-Z]+)/.freeze

      def parse
        super
        Model::Pilot.new(id: @input[1].to_i, name: @input[2])
      end
    end
  end
end
