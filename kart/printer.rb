require_relative 'printer/leaderboard'
require_relative 'printer/best_lap'

module Kart
  module Printer
    def self.printers
      [
        Kart::Printer::Leaderboard,
        Kart::Printer::BestLap
      ]
    end
  end
end
