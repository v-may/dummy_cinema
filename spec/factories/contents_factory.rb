FactoryBot.define do
  factory :content do
    film { create :movie }
    quality
    price { 2.99 }
  end
end