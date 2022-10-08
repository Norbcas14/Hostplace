# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# user = User.find(1)
# Create a set of places
10.times do
  aux_user = User.create(
    email: Faker::Internet.email,
    password: '123456'
  )
  Place.create!(
    name: Faker::Address.city,
    country: Faker::Address.country,
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph,
    user_id: aux_user.id,
    picture: Faker::LoremPixel.image
  )
end
