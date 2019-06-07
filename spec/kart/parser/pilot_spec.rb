require 'spec_helper'

describe Kart::Parser::Pilot do
  let(:parser) { Kart::Parser::Pilot.new(input) }

  subject { parser.parse }

  describe '#parse' do
    describe 'With valid input' do
      let(:input) { '23:49:08.277 038 – F.MASSA 2 1:02.852 44,275' }

      it { is_expected.to be_a_kind_of Kart::Model::Pilot }
      it { is_expected.to have_attributes(id: 38, name: 'F.MASSA') }
    end

    describe 'With invalid input' do
      let(:input) { '038 * F.MASSA' }

      it 'raise error' do
        expect { subject }.to raise_exception(ArgumentError, 'Invalid Pilot input')
      end
    end
  end
end
