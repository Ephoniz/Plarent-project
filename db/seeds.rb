# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ATMOSPHERES = %w[oxygen nitrogen carbon_dioxide argon]
GALAXIES = %w[milkyway andromeda ic1101 tadpole]

10.times do
  Planet.create(name: Faker::FunnyName.name,
                radius: Faker::Number.number(digits: 5),
                atmosphere:  ATMOSPHERES.sample,
                temperature: Faker::Number.decimal(l_digits: 3, r_digits: 2),
                description: Faker::Number.decimal(l_digits: 3, r_digits: 3),
                galaxy: GALAXIES.sample,
                price: Faker::Number.number(digits: 4),
                owner: User.first)
end