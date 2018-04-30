require 'Faker'
namespace :db do

  task :faker => :environment do
    require "#{Rails.root}/config/environment.rb"
    FactoryBot.create_list(:zombie_armor, 30)
    FactoryBot.create_list(:zombie_weapon, 30)
  end
end
