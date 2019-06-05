require_relative 'lap/avg_speed'
require_relative 'lap/number'
require_relative 'lap/duration_time'
require_relative 'lap/timestamp'

module Kart
  module Parser
    class Lap < Parser::Base
      REGEX = /^(\d{2}:\d{2}:\d{2}\.\d{3}).*(\d+)\s+(\d+:\d+\.\d{3})\s+(\d+,\d+)/.freeze

      def parse
        line = parse_line

        Model::Lap.new(
          timestamp: Timestamp.parse(line[:timestamp]),
          number: Number.parse(line[:number]),
          duration_time: DurationTime.parse(line[:duration_time]),
          avg_speed: AvgSpeed.parse(line[:avg_speed])
        )
      end

      def parse_line
        data = REGEX.match(@input)

        {
          timestamp: data[1],
          number: data[2],
          duration_time: data[3],
          avg_speed: data[4]
        }
      end
    end
  end
end
