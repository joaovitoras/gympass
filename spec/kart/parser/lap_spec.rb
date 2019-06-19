require 'spec_helper'

describe Kart::Parser::Lap do
  let(:parser) { described_class.new(input) }

  subject { parser.parse }

  describe '#parse' do
    context 'When pass valid input' do
      let(:input) { '23:49:08.277 2 1:02.852 44,275' }

      it { is_expected.to be_a_kind_of Kart::Model::Lap }

      it do
        is_expected.to have_attributes(
          timestamp: kind_of(Time),
          number: 2,
          avg_speed: 44.275,
          duration_time: 62.852
        )
      end

      context 'With less data' do
        let(:input) { '23:49:08.277 2 1:02.852' }

        it 'raise error' do
          expect { subject }.to raise_exception(ArgumentError, 'Invalid Lap input')
        end
      end
    end

    context 'When pass invalid input' do
      describe 'Invalid timestamp' do
        let(:input) { '23:49:08:227 2 1:02.852 44,275' }

        it 'raise error' do
          expect { subject }.to raise_exception(ArgumentError, 'Invalid Lap input')
        end
      end

      describe 'Invalid number' do
        let(:input) { '23:49:08.227 A 1:02.852 44,275' }

        it 'raise error' do
          expect { subject }.to raise_exception(ArgumentError, 'Invalid Lap input')
        end
      end

      describe 'Invalid duration time' do
        let(:input) { '23:49:08.277 2 1:02:852 44,275' }

        it 'raise error' do
          expect { subject }.to raise_exception(ArgumentError, 'Invalid Lap input')
        end
      end

      describe 'Invalid average speed' do
        let(:input) { '23:49:08.277 2 1:02.852 44.275' }

        it 'raise error' do
          expect { subject }.to raise_exception(ArgumentError, 'Invalid Lap input')
        end
      end
    end
  end
end
