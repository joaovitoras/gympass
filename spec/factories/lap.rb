FactoryBot.define do
  factory :lap, class: Kart::Model::Lap do
    timestamp { Time.new }
    number { 1 }
    duration_time { 123.0 }
    avg_speed { 40.0 }

    initialize_with do
      new(
        timestamp: timestamp,
        number: number,
        duration_time: duration_time,
        avg_speed: avg_speed
      )
    end
  end
end
