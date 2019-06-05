module Kart
  module Service
    class PilotResult
      attr_reader :laps, :pilot

      def initialize(pilot:, laps:)
        @pilot = pilot
        @laps = laps
      end

      def total_laps
        laps.size
      end

      def best_lap
        laps.min_by(&:duration_time)
      end

      def total_race_time
        laps.sum(&:duration_time)
      end

      def avg_speed
        laps.sum(&:avg_speed) / total_laps.to_f
      end

      def last_lap
        laps.last
      end

      def time_after_winner(winner_lap)
        last_lap.timestamp - winner_lap.timestamp
      end
    end
  end
end
