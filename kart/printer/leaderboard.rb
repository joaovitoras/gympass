module Kart
  module Printer
    class Leaderboard
      COLUMNS = {
        position: '#',
        id: 'ID',
        name: 'Nome Piloto',
        total_race_time: 'Tempo',
        total_laps: 'Voltas',
        best_lap: 'Melhor volta'
      }.freeze

      def self.print(race)
        output = template
        puts "Leaderboard\n-----------"
        puts output % COLUMNS

        race.leaderboard.map.with_index do |board, index|
          puts output % board_subs(index + 1, board)
        end
      end

      def self.template
        COLUMNS
          .keys
          .map { |column| "%{#{column}}" }
          .join(" \t")
      end

      def self.board_subs(position, board)
        {
          position: position,
          id: board.pilot.id,
          name: board.pilot.name,
          total_race_time: Time.at(board.total_race_time).strftime('%M:%S'),
          total_laps: board.total_laps,
          best_lap: board.best_lap.number
        }
      end
    end
  end
end
