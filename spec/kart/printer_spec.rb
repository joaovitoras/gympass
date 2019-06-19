require 'spec_helper'

describe Kart::Printer do
  describe '#printers' do
    subject { described_class.printers }

    it { is_expected.to eq([Kart::Printer::Leaderboard, Kart::Printer::BestLap]) }
  end
end
