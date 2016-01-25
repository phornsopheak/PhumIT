FactoryGirl.define do
  factory :user do
    username {Faker::Name.name}
    nickname {Faker::Name.name}
    password "12345678"
    password_confirmation "12345678"
    sequence(:email) {|n| "test-#{n}@phumit.com"}
    role 1
  end
end
