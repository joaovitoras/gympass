require 'spec_helper'

describe Kart::Parser::DurationTime do
  let(:parser) { described_class.new(input) }

  subject { parser.parse }

  describe '#parse' do
    context 'With valid input' do
      let(:minutes) { 1 }
      let(:seconds) { 2 }
      let(:ms) { 852 }
      let(:input) { "#{minutes}:#{seconds}.#{ms}" }

      it { is_expected.to be(62.852) }
    end

    context 'With invalid input' do
      let(:input) { 'A' }

      it 'raise error' do
        expect { subject }.to raise_exception(ArgumentError, 'Invalid DurationTime input')
      end
    end
  end
end
