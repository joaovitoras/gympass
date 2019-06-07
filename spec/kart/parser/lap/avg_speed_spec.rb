require 'spec_helper'

describe Kart::Parser::AvgSpeed do
  let(:parser) { Kart::Parser::AvgSpeed.new(input) }

  subject { parser.parse }

  describe '#parse' do
    describe 'With valid input' do
      let(:input) { '44,275' }

      it do
        is_expected.to be(44.275)
      end
    end

    describe 'With invalid input' do
      let(:input) { '22 A' }

      it 'raise error' do
        expect { subject }.to raise_exception(ArgumentError, 'Invalid AvgSpeed input')
      end
    end
  end
end
