FactoryBot.define do
  factory :episode do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.paragraph }
    number { 1 }
    season
  end
end