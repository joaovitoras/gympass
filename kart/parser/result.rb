module Kart
  module Parser
    class Result < Parser::Base
      LINE_REGEX = /^(\d{2}:\d{2}:\d{2}\.\d{3})\s+(\d{3} – [A-Z]\.[A-Z]+)\s+(\d+)\s+(\d+:\d+\.\d{3})\s+(\d+,\d+)/.freeze

      def parse
        @input = @input.map { |line| line_to_lap_data(line) }
        @input = group_by_pilot
        generate_result
      rescue StandardError => _e
        invalid_input
      end

      private

      def line_to_lap_data(line)
        [Parser::Pilot.parse(line), Parser::Lap.parse(line)]
      end

      def group_by_pilot
        @input
          .group_by(&:first)
          .map { |pilot, data| [pilot, data.map(&:last)] }
      end

      def generate_result
        @input.map do |pilot, laps|
          Service::PilotResult.new(pilot: pilot, laps: laps)
        end
      end
    end
  end
end
