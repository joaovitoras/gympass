module Kart
  module Parser
    class Result < Parser::Base
      LINE_REGEX = /^(\d{2}:\d{2}:\d{2}\.\d{3})\s+(\d{3} – [A-Z]\.[A-Z]+)\s+(\d+)\s+(\d+:\d+\.\d{3})\s+(\d+,\d+)/.freeze

      def initialize(file_path)
        raise ArgumentError, 'Input file is nil. Provide one input to start a run' if file_path.nil?
        raise Exceptions::FileNotFound unless File.exist?(file_path)

        @lines = File.readlines(file_path)
      end

      def parse
        @data = @lines.map { |line| line_to_lap(line) }
        @data = group_by_pilot
        generate_result
      end

      private

      def line_to_lap(line)
        data = LINE_REGEX.match(line)

        {
          timestamp: data[1],
          pilot: data[2],
          number: data[3],
          duration_time: data[4],
          avg_speed: data[5]
        }
      end

      def group_by_pilot
        @data.group_by { |lap| lap[:pilot] }
      end

      def generate_result
        @data.map do |pilot_data, laps_data|
          pilot = Model::Pilot.new(Parser::Pilot.parse(pilot_data))
          laps = laps_data.map do |data|
            Model::Lap.new(Parser::Lap.parse(data))
          end

          Service::PilotResult.new(pilot: pilot, laps: laps)
        end
      end
    end
  end
end
