# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'

user = User.first
puts "Create a set of places"
10.times do |i|
  Place.create!(
    name: Faker::Address.city,
    country: Faker::Address.country,
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph,
    user: user,
    photo: URI.open(Faker::LoremPixel.image)
  )
end
