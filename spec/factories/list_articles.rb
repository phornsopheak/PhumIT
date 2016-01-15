FactoryGirl.define do
  factory :list_article do
    list {List.all.sample}
  end
end
