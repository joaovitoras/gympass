require_relative 'lap/avg_speed'
require_relative 'lap/number'
require_relative 'lap/duration_time'
require_relative 'lap/timestamp'

module Kart
  module Parser
    class Lap < Parser::Base
      REGEX = /^(\d{2}:\d{2}:\d{2}\.\d{3}).*(\d+)\s+(\d+:\d+\.\d{3})\s+(\d+,\d+)/.freeze

      def parse
        super

        Model::Lap.new(
          timestamp: Timestamp.parse(@input[1]),
          number: Number.parse(@input[2]),
          duration_time: DurationTime.parse(@input[3]),
          avg_speed: AvgSpeed.parse(@input[4])
        )
      end
    end
  end
end
