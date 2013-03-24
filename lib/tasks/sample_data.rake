namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

  #creates initial admin user
  	admin = User.create!(email: "admin@example.com",
                         password: "admin123",
                         password_confirmation: "admin123")

  #creates 15 blog articles
    15.times do |i|
      title   = Faker::Lorem.sentence
      content = Faker::Lorem.sentence(75)
      Article.create!(title: title, content: content)
    end
  end
end