FactoryBot.define do
  factory :keyword do
    name { FFaker::Book.unique.genre }
  end

  factory :invalid_keyword, parent: :keyword do
    name { nil }
  end
end
