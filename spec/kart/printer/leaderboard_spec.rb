require 'spec_helper'

describe Kart::Printer::Leaderboard do
  let(:pilot) { build(:pilot, name: 'John') }
  let(:laps_pilot) { [build(:lap, number: 1, duration_time: 9)] }
  let(:results) { [build(:pilot_result, pilot: pilot, laps: laps_pilot)] }
  let(:race) { build(:race, results: results) }

  describe '#new' do
    subject { described_class.new(race) }

    it { is_expected.to be_a_kind_of described_class }
  end

  describe '#print' do
    let(:outputs) do
      [
        "Leaderboard\n-----------",
        "# \tID \tNome Piloto \tTempo \tVoltas \tM.V. \tV.M. \tD. Vencedor",
        "1 \t4 \tJohn \t00:09 \t1 \t1 \t40.0 \t00:00"
      ]
    end

    it 'print to STDOUT title, header and body' do
      outputs.each do |output|
        expect(STDOUT).to receive(:puts).with(output)
      end

      described_class.new(race).print
    end
  end
end
