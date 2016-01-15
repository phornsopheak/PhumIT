namespace :db do
  desc "Remaking data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke

    puts "Creating category"
    5.times {FactoryGirl.create :category}
  end
end
