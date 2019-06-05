require 'spec_helper'

describe Kart::Model::Pilot do
  describe '#new' do
    it 'build pilot' do
      pilot = build(:pilot, id: 1, name: 'John')

      expect(pilot).to have_attributes(
        id: 1,
        name: 'John'
      )
      expect(pilot).to be_a_kind_of(Kart::Model::Pilot)
    end

    context 'when params come from parser' do
      it 'build pilot' do
        pilot = Kart::Parser::Pilot.parse('23:49:08.277 038 – F.MASSA 2 1:02.852 44,275')

        expect(pilot).to have_attributes(
          id: 38,
          name: 'F.MASSA'
        )
        expect(pilot).to be_a_kind_of(Kart::Model::Pilot)
      end
    end
  end
end
