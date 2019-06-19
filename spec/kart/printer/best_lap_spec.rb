require 'spec_helper'

describe Kart::Printer::BestLap do
  let(:pilot) { build(:pilot, name: 'John') }
  let(:laps_pilot) { [build(:lap, number: 1, duration_time: 9)] }
  let(:results) { [build(:pilot_result, pilot: pilot, laps: laps_pilot)] }
  let(:race) { build(:race, results: results) }

  describe '#new' do
    subject { described_class.new(race) }

    it { is_expected.to be_a_kind_of described_class }
  end

  describe '#print' do
    subject { described_class.new(race).print }
    let(:outputs) do
      [
        "Best lap\n--------",
        "ID \tNome Piloto \tTempo \tVoltas \tV.M.",
        "#{pilot.id} \tJohn \t00:09 \t1 \t40.0"
      ]
    end

    it 'print to STDOUT title, header and body' do
      outputs.each do |output|
        expect(STDOUT).to receive(:puts).with(output)
      end

      subject
    end
  end
end
