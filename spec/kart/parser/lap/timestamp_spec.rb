require 'spec_helper'

describe Kart::Parser::Timestamp do
  let(:parser) { Kart::Parser::Timestamp.new(input) }

  subject { parser.parse }

  describe '#parse' do
    context 'With valid input' do
      let(:input) { '23:49:08' }

      it do
        is_expected.to have_attributes(
          hour: 23,
          min: 49,
          sec: 8
        )
      end
    end

    context 'With invalid input' do
      let(:input) { '23 49 08' }

      it 'raise error' do
        expect { subject }.to raise_exception(ArgumentError, 'Invalid Timestamp input')
      end
    end
  end
end
