module Kart
  module Model
    class Pilot
      attr_reader :name, :id

      def initialize(id:, name:)
        @id = id
        @name = name
      end
    end
  end
end
