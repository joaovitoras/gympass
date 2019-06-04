module Kart
  module Service
    class PilotResult
      attr_reader :laps, :pilot

      def initialize(pilot:, laps:)
        @pilot = pilot
        @laps = laps
      end

      def total_race_time
        laps.sum(&:duration_time)
      end

      def total_laps
        laps.size
      end

      def best_lap
        laps.min_by(&:duration_time)
      end
    end
  end
end
