module Kart
  module Model
    class Pilot
      attr_reader :name, :id

      def initialize(id:, name:)
        @id = id
        @name = name
      end

      def hash
        id.hash
      end

      def eql?(other)
        id == other.id
      end
    end
  end
end
