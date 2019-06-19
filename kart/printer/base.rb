module Kart
  module Printer
    class Base
      attr_accessor :race

      COLUMNS = {
        position: '#',
        id: 'ID',
        name: 'Nome Piloto',
        total_race_time: 'Tempo', # Tempo total de corrida
        total_laps: 'Voltas', # Total de voltas
        best_lap: 'M.V.', # Melhor volta
        avg_speed: 'V.M.', # Tempo medio de velocidade
        time_after_winner: 'D. Vencedor' # Diferenca do vencedor
      }.freeze

      def initialize(race)
        @race = race
      end

      def print
        print_title
        print_header
        print_body
      end

      private

      def print_title
        raise 'Title is not set' if @title.nil?

        puts @title + "\n#{'-' * @title.size}"
      end

      def print_header
        raise 'Template is not set' if @template.nil?

        puts @template % @columns
      end

      def print_body
        raise NotImplementedError
      end

      def select_columns(*columns)
        @columns = COLUMNS.slice(*columns)
        @template = generate_template
      end

      def generate_template
        @columns.keys.map { |column| "%{#{column}}" }.join(" \t")
      end

      def time_output(seconds)
        Time.at(seconds).strftime('%M:%S')
      end
    end
  end
end
