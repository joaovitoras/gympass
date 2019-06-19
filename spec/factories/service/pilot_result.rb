FactoryBot.define do
  factory :pilot_result, class: Kart::Service::PilotResult do
    pilot { build(:pilot) }
    laps { [build(:lap)] }

    initialize_with { new(pilot: pilot, laps: laps) }
  end
end
