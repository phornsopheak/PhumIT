FactoryGirl.define do
  factory :list do
    title {Faker::Lorem.words}
    description {Faker::Lorem.paragraph}
  end
end
