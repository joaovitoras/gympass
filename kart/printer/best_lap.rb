module Kart
  module Printer
    class BestLap < Printer::Base
      def initialize(race)
        @title = 'Best lap'
        @pilot, @lap = race.best_lap
        select_columns(:id, :name, :total_race_time, :total_laps, :avg_speed)

        super
      end

      private

      def print_body
        puts @template % substitutions
      end

      def substitutions
        {
          total_race_time: Time.at(@lap.duration_time).strftime('%M:%S'),
          id: @pilot.id,
          name: @pilot.name,
          total_laps: @lap.number,
          avg_speed: @lap.avg_speed
        }
      end
    end
  end
end
