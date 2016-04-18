# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rand(12..19).times do
  user = User.create(username: Faker::Internet.user_name, password: "password")
  rand(15..30).times do
    Bloop.create(message: Faker::Hipster.sentence(rand(3..15)), user_id: user.id)
  end
end
