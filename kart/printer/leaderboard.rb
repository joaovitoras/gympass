module Kart
  module Printer
    class Leaderboard < Printer::Base
      def initialize(race)
        @title = 'Leaderboard'
        select_columns(:position, :id, :name, :total_race_time, :total_laps, :best_lap, :avg_speed, :time_after_winner)

        super
      end

      def print_body
        race.leaderboard.map.with_index(1) do |result, index|
          puts @template % substitutions(index, result)
        end
      end

      def substitutions(position, result)
        {
          position: position,
          id: result.pilot.id,
          name: result.pilot.name,
          total_race_time: time_output(result.total_race_time),
          total_laps: result.total_laps,
          best_lap: result.best_lap.number,
          avg_speed: result.avg_speed.round(3),
          time_after_winner: time_output(result.time_after_winner(race.winner_lap))
        }
      end
    end
  end
end
