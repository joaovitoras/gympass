require 'spec_helper'
require 'pry'

describe Kart::Model::Lap do
  describe '#new' do
    it 'works' do
      lap = build(
        :lap,
        timestamp: Time.new,
        number: 1,
        duration_time: 190.0,
        avg_speed: 123.0
      )

      expect(lap).to have_attributes(
        timestamp: kind_of(Time),
        number: 1,
        duration_time: 190.0,
        avg_speed: 123.0
      )
      expect(lap).to be_a_kind_of(Kart::Model::Lap)
    end

    context 'when builded from parser' do
      it 'works' do
        lap = Kart::Parser::Lap.parse('23:49:08.277 038 – F.MASSA 2 1:02.852 44,275')

        expect(lap).to have_attributes(
          timestamp: kind_of(Time),
          number: 2,
          avg_speed: 44.275,
          duration_time: 62.852
        )
        expect(lap).to be_a_kind_of(Kart::Model::Lap)
      end
    end
  end
end
