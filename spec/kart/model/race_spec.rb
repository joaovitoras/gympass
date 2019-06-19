require 'spec_helper'

describe Kart::Model::Race do
  let(:pilot_1) { build(:pilot, name: 'John') }
  let(:pilot_2) { build(:pilot, name: 'Wick') }

  let(:laps_pilot_1) do
    [
      build(:lap, number: 1, duration_time: 9),
      build(:lap, number: 2, duration_time: 20),
      build(:lap, number: 3, duration_time: 25)
    ]
  end

  let(:laps_pilot_2) do
    [
      build(:lap, number: 1, duration_time: 20),
      build(:lap, number: 2, duration_time: 23),
      build(:lap, number: 3, duration_time: 10)
    ]
  end

  let(:results) do
    [
      build(:pilot_result, pilot: pilot_1, laps: laps_pilot_1),
      build(:pilot_result, pilot: pilot_2, laps: laps_pilot_2)
    ]
  end

  let(:race) { build(:race, results: results) }
  subject { race }

  describe '#new' do
    it { is_expected.to be_a_kind_of(described_class) }
  end

  describe '#leaderboard' do
    subject { race.leaderboard }

    it { is_expected.not_to be_empty }
    it { is_expected.to be_a_kind_of(Array) }
    it { is_expected.to match_array([kind_of(Kart::Service::PilotResult), kind_of(Kart::Service::PilotResult)]) }

    it 'returns final position from pilots' do
      expect(subject[0].pilot).to eq(pilot_2)
      expect(subject[1].pilot).to eq(pilot_1)
    end
  end

  describe '#best_lap' do
    subject { race.best_lap }

    it { is_expected.not_to be_empty }
    it { is_expected.to be_a_kind_of(Array) }
    it { is_expected.to match_array([kind_of(Kart::Model::Pilot), kind_of(Kart::Model::Lap)]) }

    it 'returns first pilot and first lap' do
      expect(subject[0]).to eq(pilot_1)
      expect(subject[1]).to eq(laps_pilot_1[0])
    end
  end

  describe '#winner_lap' do
    subject { race.winner_lap }

    it { is_expected.to be_a_kind_of(Kart::Model::Lap) }
    it { is_expected.to eq(laps_pilot_2.last) }
  end
end
