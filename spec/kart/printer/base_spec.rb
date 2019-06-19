require 'spec_helper'

describe Kart::Printer::Base do
  let(:race) { build(:race) }

  before do
    allow(STDOUT).to receive(:puts)
  end

  describe '#new' do
    subject { described_class.new(race) }

    it { is_expected.to be_a_kind_of described_class }
  end

  describe '#print' do
    context 'when dont have title' do
      subject { described_class.new(race).print }

      it 'raise error' do
        expect { subject }.to raise_exception(RuntimeError, 'Title is not set')
      end
    end

    context 'when dont have template' do
      subject do
        printer = described_class.new(race)
        printer.instance_variable_set(:@title, 'Base')
        printer.print
      end

      it 'raise error' do
        expect { subject }.to raise_exception(RuntimeError, 'Template is not set')
      end
    end

    context 'when dont implement print_body' do
      subject do
        printer = described_class.new(race)
        printer.instance_variable_set(:@title, 'Base')
        printer.send(:select_columns, :id, :name)
        printer
      end

      it 'raise error' do
        expect(subject).to receive(:print_body).and_call_original
        expect { subject.print }.to raise_exception(NotImplementedError)
      end
    end
  end
end
