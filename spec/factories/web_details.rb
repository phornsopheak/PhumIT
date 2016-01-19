FactoryGirl.define do
  factory :web_detail do
    name "PhumIT"
    address {Faker::Address.street_address}
    email "itphum@gmail.com"
    telephone {Faker::PhoneNumber.cell_phone}
    about_us {Faker::Lorem.paragraphs}
    fb_page "https://www.facebook.com/%E1%9E%97%E1%9E%BC%E1%9E%98%E1%9E%B7%E1%9E%A2%E1%9E%B6%E1%9E%99%E1%9E%92%E1%9E%B8-1709498292628919/"
    youtube "https://plus.google.com/u/0/109088437152195157227?hl=en"
    tweatter "https://www.facebook.com/%E1%9E%97%E1%9E%BC%E1%9E%98%E1%9E%B7%E1%9E%A2%E1%9E%B6%E1%9E%99%E1%9E%92%E1%9E%B8-1709498292628919/"
    google_plus "https://plus.google.com/u/0/109088437152195157227?hl=en"
  end
end
