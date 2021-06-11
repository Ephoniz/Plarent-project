# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

ATMOSPHERES = %w[oxygen nitrogen carbon_dioxide argon]
GALAXIES = %w[milkyway andromeda ic1101 tadpole]
PHOTOS = ['https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Hypothetical_ice_planet_illustration.jpg/1200px-Hypothetical_ice_planet_illustration.jpg',
          'https://static.wikia.nocookie.net/wiki-los-200-mundo/images/4/47/Planeta_Alaska.jpg/revision/latest?cb=20170116214151&path-prefix=es',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqvgK8m1LgZeyul1C4buTwlzvVzbIMV4AB953WJzakr2Hc25QWXxBH442bq68kb8PsCZo&usqp=CAU',
          'https://images.theconversation.com/files/388811/original/file-20210310-13-13fmyhj.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=675.0&fit=crop',
          'https://www.abc.net.au/reslib/201211/r1034888_11872090.jpg',
          'https://static.scientificamerican.com/sciam/cache/file/17822D90-26C5-410A-B426CD426DD9D189_source.jpg',
          'https://static.scientificamerican.com/sciam/cache/file/E130EEB0-A6BA-4DEA-A84BE1B861F44CE5_source.gif?w=590&h=800&D2E85F0E-2EF0-4885-A2B03F95387DDA0F',
          'https://media.wired.com/photos/5d04042aea706e48d9bcd1bf/master/w_2560%2Cc_limit/Science-Neptune-TA-PIA01492_orig.jpg']


user_et = User.new
  user_et.first_name = 'ET'
  user_et.last_name = 'the Extra-Terrestrial'
  user_et.email = 'ETisInDaHouse@hotmail.com'
  user_et.password = '123456'
  user_et.password_confirmation = '123456'
  user_et.save!

file_profile = URI.open('https://www.unir.net/wp-content/uploads/2019/06/ET.jpg')
user_et.profile_picture.attach(io: file_profile, filename: 'et.jpg', content_type: 'image/jpg')

8.times do |index|
  current_planet = Planet.create(name: Faker::Space.planet,
                                  radius: Faker::Number.number(digits: 5),
                                  atmosphere:  ATMOSPHERES.sample,
                                  temperature: Faker::Number.decimal(l_digits: 2),
                                  description: Faker::Movies::StarWars.quote,
                                  galaxy: GALAXIES.sample,
                                  price: Faker::Number.number(digits: 4),
                                  owner: User.first,
                                )
  file = URI.open(PHOTOS[index])
  current_planet.photos.attach(io: file, filename: 'nes.png', content_type: 'image/jpg')

end