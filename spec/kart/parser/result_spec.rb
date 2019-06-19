require 'spec_helper'

describe Kart::Parser::Result do
  let(:parser) { described_class.new(input) }

  subject { parser.parse }

  describe '#parse' do
    context 'With valid input' do
      let(:input) { File.readlines("#{RSPEC_ROOT}/fixtures/files/result.txt") }

      it { is_expected.not_to be_empty }
      it { is_expected.to be_a_kind_of(Array) }
      it { is_expected.to match_array([kind_of(Kart::Service::PilotResult), kind_of(Kart::Service::PilotResult)]) }

      it 'returns a list of pilot results with pilot and laps' do
        expect(subject[0].pilot.name).to eq('F.MASSA')
        expect(subject[0].laps.count).to eq(3)

        expect(subject[1].pilot.name).to eq('R.BARRICHELLO')
        expect(subject[1].laps.count).to eq(3)
      end
    end

    context 'With invalid input' do
      let(:input) { 'Teste 123' }

      it 'raise error' do
        expect { subject }.to raise_exception(ArgumentError, 'Invalid Result input')
      end
    end
  end
end
