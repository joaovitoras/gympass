module Kart
  module Model
    class Lap
      attr_accessor :timestamp, :number, :duration_time, :avg_speed

      def initialize(timestamp:, number:, duration_time:, avg_speed:)
        @timestamp = timestamp
        @number = number
        @duration_time = duration_time
        @avg_speed = avg_speed
      end
    end
  end
end
