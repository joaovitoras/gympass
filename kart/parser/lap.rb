require_relative 'lap/avg_speed'
require_relative 'lap/number'
require_relative 'lap/duration_time'
require_relative 'lap/timestamp'

module Kart
  module Parser
    class Lap < Parser::Base
      def parse
        {
          timestamp: Timestamp.parse(@input[:timestamp]),
          number: Number.parse(@input[:number]),
          duration_time: DurationTime.parse(@input[:duration_time]),
          avg_speed: AvgSpeed.parse(@input[:avg_speed])
        }
      end
    end
  end
end
