FactoryGirl.define do
  factory :article do
    title "aa"
    description {Faker::Lorem.paragraphs}
    view {Faker::Number.number(3)}
    source {Faker::Company.name}
    user {User.all.sample}
    state 0
    link_source "lll"
    image "image"

    after(:create) do |article|
      FactoryGirl.create :list_article, article: article
    end
  end
end
