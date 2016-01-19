namespace :db do
  desc "Remaking data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke

    puts "Creating user"
    5.times {FactoryGirl.create :user}

    puts "Creating web detail"
    FactoryGirl.create :web_detail

    puts "Creating category"
    5.times {FactoryGirl.create :category}
  end
end
