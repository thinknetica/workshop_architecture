FactoryBot.define do
  factory :genre do
    slug { FFaker::Internet.unique.slug }
    name { FFaker::Book.unique.genre }
    genre_group
  end

  factory :invalid_genre, parent: :genre do
    slug { nil }
    name { nil }
    genre_group
  end
end
