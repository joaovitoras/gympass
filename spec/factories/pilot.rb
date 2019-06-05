FactoryBot.define do
  factory :pilot, class: Kart::Model::Pilot do
    id
    name

    initialize_with { new(id: id, name: name) }
  end
end
