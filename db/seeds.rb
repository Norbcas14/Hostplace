# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# Character.create(name: "Luke", movie: movies.first)
require 'faker'

30.times do
  Place.create(
    name: Faker::Space.nebula,
    address: Faker::Address.street_address,
    country: Faker::Mountain.name,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    picture: Faker::Placeholdit.image
  )
end
