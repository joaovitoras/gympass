require 'spec_helper'

describe Kart::Service::PilotResult do
  let(:pilot) { build(:pilot, name: 'Gympass') }
  let!(:winner_lap) { build(:lap, timestamp: Time.parse('2019-06-02 08:15:40')) }

  let(:laps_pilot) do
    [
      build(:lap, number: 1, duration_time: 9, avg_speed: 10, timestamp: Time.parse('2019-06-02 08:15:00')),
      build(:lap, number: 2, duration_time: 20, avg_speed: 20, timestamp: Time.parse('2019-06-02 08:15:20')),
      build(:lap, number: 3, duration_time: 25, avg_speed: 30, timestamp: Time.parse('2019-06-02 08:15:45'))
    ]
  end

  let(:pilot_result) { build(:pilot_result, pilot: pilot, laps: laps_pilot) }

  describe '#new' do
    subject { pilot_result }

    it { is_expected.to be_a_kind_of described_class }
  end

  describe '#total_laps' do
    subject { pilot_result.total_laps }

    it { is_expected.to be(3) }
  end

  describe '#best_lap' do
    subject { pilot_result.best_lap }

    it { is_expected.to be(laps_pilot[0]) }
  end

  describe '#total_race_time' do
    subject { pilot_result.total_race_time }

    it { is_expected.to be(54) }
  end

  describe '#avg_speed' do
    subject { pilot_result.avg_speed }

    it { is_expected.to be(20.0) }
  end

  describe '#last_lap' do
    subject { pilot_result.last_lap }

    it { is_expected.to be(laps_pilot[2]) }
  end

  describe '#time_after_winner' do
    subject { pilot_result.time_after_winner(winner_lap) }

    it { is_expected.to be(5.0) }
  end
end
