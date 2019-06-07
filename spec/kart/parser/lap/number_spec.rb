require 'spec_helper'

describe Kart::Parser::Number do
  let(:parser) { Kart::Parser::Number.new(input) }

  subject { parser.parse }

  describe '#parse' do
    describe 'With valid input' do
      let(:input) { '1' }

      it { is_expected.to be(1) }
    end

    describe 'With invalid input' do
      let(:input) { 'A' }

      it 'raise error' do
        expect { subject }.to raise_exception(ArgumentError, 'Invalid Number input')
      end
    end
  end
end
