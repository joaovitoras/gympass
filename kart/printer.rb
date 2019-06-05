require_relative 'printer/base'
require_relative 'printer/best_lap'
require_relative 'printer/leaderboard'

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
