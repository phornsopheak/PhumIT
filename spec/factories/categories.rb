FactoryGirl.define do
  factory :category do
    title {Faker::Lorem.words}
    description {Faker::Lorem.paragraph}

    after(:create) do |category|
      FactoryGirl.create_list :list, 4, category: category
      category.articles << FactoryGirl.create_list(:article, 100)
    end
  end
end
