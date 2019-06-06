require 'spec_helper'

describe Kart::Model::Pilot do
  describe '#new' do
    let(:pilot) { build(:pilot, id: 1, name: 'John') }
    subject { pilot }

    it { is_expected.to be_a_kind_of Kart::Model::Pilot }
    it { is_expected.to have_attributes(id: 1, name: 'John') }
  end
end
