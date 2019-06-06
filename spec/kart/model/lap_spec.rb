require 'spec_helper'
require 'pry'

describe Kart::Model::Lap do
  describe '#new' do
    let(:lap) { build(:lap, timestamp: Time.new, number: 1, duration_time: 190.0, avg_speed: 123.0) }
    subject { lap }

    it do
      is_expected.to have_attributes(
        timestamp: kind_of(Time),
        number: 1,
        duration_time: 190.0,
        avg_speed: 123.0
      )
    end

    it { is_expected.to be_a_kind_of(Kart::Model::Lap) }
  end
end
