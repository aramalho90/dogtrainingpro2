# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do
  Dog.create!([{
    name: Faker::Creature::Dog.name,
    sex: Faker::Alphanumeric.alpha(number: 1),
    breed: Faker::Creature::Dog.breed,
    obs: Faker::TvShows::GameOfThrones.quote,
    ownername: Faker::TvShows::GameOfThrones.character,
    city: Faker::TvShows::GameOfThrones.city,
    allergies: Faker::Creature::Dog.meme_phrase
  }])
end