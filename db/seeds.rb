# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email(first_name)
  User.create(first_name: first_name, last_name: last_name, email: email, password: last_name)
end


10.times do
  name = Faker::StarWars.planet
  description = Faker::Hipster.sentence
  location = Faker::Address.street_address + Faker::Address.city
  capacity = rand(15..1000)
  daily_price = rand(20..1500)
  user_id = rand(1..10)
  Plot.create(name: name, description: description, location: location, capacity: capacity, daily_price: daily_price, user_id: user_id)
end
