FactoryBot.define do
  sequence :name do |n|
    "People #{n}"
  end

  sequence :id
end
