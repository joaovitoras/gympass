module Kart
  module Printer
    class BestLap
      COLUMNS = Kart::Printer::Leaderboard::COLUMNS

      def self.print(race)
        puts "Best lap\n--------"
        pilot, best_lap = race.best_lap
        output = template

        puts output % subs(pilot, best_lap)
      end

      def self.template
        COLUMNS
          .keys
          .map { |column| "%{#{column}}" }
          .join(" \t")
      end

      def self.subs(pilot, lap)
        {
          position: 1,
          total_race_time: Time.at(lap.duration_time).strftime('%M:%S'),
          id: pilot.id,
          name: pilot.name,
          total_laps: lap.number,
          best_lap: 1
        }
      end
    end
  end
end
