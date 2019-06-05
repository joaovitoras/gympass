module Kart
  module Parser
    class Result < Parser::Base
      LINE_REGEX = /^(\d{2}:\d{2}:\d{2}\.\d{3})\s+(\d{3} – [A-Z]\.[A-Z]+)\s+(\d+)\s+(\d+:\d+\.\d{3})\s+(\d+,\d+)/.freeze

      def initialize(file_path)
        raise ArgumentError, 'Input file is nil' if file_path.nil?

        @lines = File.readlines(file_path)
      end

      def parse
        @data = @lines.map { |line| line_to_lap_data(line) }
        @data = group_by_pilot
        generate_result
      end

      private

      def line_to_lap_data(line)
        [Parser::Pilot.parse(line), Parser::Lap.parse(line)]
      end

      def group_by_pilot
        @data
          .group_by(&:first)
          .map { |pilot, data| [pilot, data.map(&:last)] }
      end

      def generate_result
        @data.map do |pilot, laps|
          Service::PilotResult.new(pilot: pilot, laps: laps)
        end
      end
    end
  end
end
