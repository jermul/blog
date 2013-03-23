namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

  #creates 30 blog posts
    user = admin
    30.times do |i|
      title   = Faker::Lorem.sentence
      content = Faker::Lorem.sentence(75)
      Post.create!(title: title, content: content)
    end
  end
end