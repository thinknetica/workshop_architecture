FactoryBot.define do
  factory :genre_group do
    name { FFaker::Book.unique.genre }
  end

  factory :invalid_genre_group, parent: :genre_group do
    name { nil }
  end
end
