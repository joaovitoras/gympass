FactoryBot.define do
  factory :race, class: Kart::Model::Race do
    results { build(:pilot_result) }

    initialize_with { new(results) }
  end
end
