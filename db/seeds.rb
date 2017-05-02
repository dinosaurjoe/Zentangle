# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Request.destroy_all
Role.destroy_all
User.destroy_all
Project.destroy_all

password = Faker::Internet.password(8)

20.times do
  User.create(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Food.ingredient,
    bio: Faker::Lorem.paragraph(2),
    profile_img: "http://placehold.it/220x220"
    )
end

CATEGORY = ["Film", "Music", "Dance", ""]

SKILLS = ["acting", "directing", "writing", "editting", "sound"]

40.times do
  Project.create(
    title: Faker::TwinPeaks.quote
    full_description: Faker::Lorem.paragraph(4)
    category: 0
    subcategory: 0
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime
    short_description: Faker::Lorem.paragraph(1),
    picture: "http://placehold.it/220x220"
    owner: User.all.sample
    total_budget: "$20,000"
    skills: "#{SKILLS.sample} and #{SKILLS.sample}"
    portfolio_url: "www.portfolio.com"
  )
end

COMPENSATION = ["pizza", "20 dollars", "free coffee", "1,000 dollars", "10\% of profits", "5\% of profits", "25\% of profits"]

200.times do
  Role.create(
    project: Project.all.sample
    description: Faker::Lorem.paragraph(1),
    requirements: "2 years of experience",
    compensation: COMPENSATION.sample,
    title: Faker::TwinPeaks.character,
  )
end

40.times do
  Request.create(
    project: Project.all.sample
    user: User.all.sample
    role: Role.all.sample
    user_confirmed: false
    owner_confrimed: true
    owner_message: "join me"
    user_message: "how much $$$"
  )
end




