module Kart
  module Model
    class Race
      attr_accessor :final_result

      def initialize(final_result)
        @final_result = final_result
      end

      def leaderboard
        final_result.sort_by(&:total_race_time)
      end

      def best_lap
        final_result
          .map { |result| [result.pilot, result.best_lap] }
          .min_by { |_, best_lap| best_lap.duration_time }
      end

      def winner_lap
        leaderboard.first.laps.last
      end
    end
  end
end
