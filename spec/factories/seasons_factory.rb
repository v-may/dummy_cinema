FactoryBot.define do
  factory :season do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.paragraph }

    trait :with_episodes do
      transient do
        episodes_quantity { 3 }
      end

      after(:create) do |season, evaluator|
        evaluator.episodes_quantity.times { |i| create :episode, season: season, number: (i + 1) }
      end
    end

    factory :season_with_episodes, traits: [:with_episodes]
  end
end
