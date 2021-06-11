# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Booking.destroy_all
Planet.destroy_all
User.destroy_all

ATMOSPHERES = %w[oxygen nitrogen carbon_dioxide argon]
GALAXIES = %w[milkyway andromeda ic1101 tadpole]
PHOTOS = ['https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Hypothetical_ice_planet_illustration.jpg/1200px-Hypothetical_ice_planet_illustration.jpg',
          'http://www.mipetitmadrid.com/web_mipetitmadrid/docs/6-curiosidades-sobre.gif',
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

user_martin = User.new
  user_martin.first_name = 'Martin'
  user_martin.last_name = 'Defrutos'
  user_martin.email = "MartinHot69@hotamil.com"
  user_martin.password = '123456'
  user_martin.password_confirmation = '123456'
  user_martin.save!

profile_martin = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_920,q_auto,w_976/v1618234205/xyotl2gz1ziz0eqaslv6.webp')
user_martin.profile_picture.attach(io: profile_martin, filename: 'nes.png', content_type: 'image/jpg')

planet1 = URI.open('https://static.wikia.nocookie.net/starwars/images/1/1d/Hoth_SWCT.png/revision/latest/top-crop/width/360/height/360?cb=20160630022322')
planet12 = URI.open('https://lumiere-a.akamaihd.net/v1/images/Hoth_d074d307.jpeg?region=0%2C0%2C1200%2C675&width=960')
planet13 = URI.open('https://cdn.wallpapersafari.com/58/87/46eJn5.jpg')
planet14 = URI.open('https://i.pinimg.com/originals/a7/7f/48/a77f486665f37182fa04cbbfd202a7ab.jpg')

planet_1 = Planet.create(name: 'Hoth',
                        radius: Faker::Number.number(digits: 5),
                        atmosphere:  ATMOSPHERES.sample,
                        temperature: Faker::Number.decimal(l_digits: 2),
                        description: 'Hoth is an ice planet, where normally it is -200 Degrees. Its a great place for skiing, however you cant stay long because you will freeze',
                        galaxy: GALAXIES.sample,
                        price: Faker::Number.number(digits: 4),
                        owner: User.last,
)

planet_1.photos.attach(io: planet1, filename: 'nes.png', content_type: 'image/jpg')
planet_1.photos.attach(io: planet12, filename: 'nes.png', content_type: 'image/jpg')
planet_1.photos.attach(io: planet13, filename: 'nes.png', content_type: 'image/jpg')
planet_1.photos.attach(io: planet14, filename: 'nes.png', content_type: 'image/jpg')



planet2 = URI.open('https://static.wikia.nocookie.net/starwars/images/b/b0/Tatooine_TPM.png/revision/latest?cb=20131019121937')
planet22 = URI.open('https://media.wired.com/photos/5909633776f462691f012e5c/master/pass/tatooine-ft.jpg')
planet23 = URI.open('https://www.fanthatracks.com/wp-content/uploads/2020/09/acme-phaserunner-tatooine_a.jpg')
planet24 = URI.open('https://starwarsthoughts.files.wordpress.com/2019/12/screen-shot-2019-12-06-at-8.27.16-pm.png?w=720')

planet_2 = Planet.create(name: 'Tatooine',
                        radius: Faker::Number.number(digits: 5),
                        atmosphere:  ATMOSPHERES.sample,
                        temperature: Faker::Number.decimal(l_digits: 2),
                        description: 'Tatooine, is probably the greatest planet, its always has a perfect temperature of 34 degrees. You can spend there most of the year, because the people are really fun and there are many parties.',
                        galaxy: GALAXIES.sample,
                        price: Faker::Number.number(digits: 4),
                        owner: User.last,
)

planet_2.photos.attach(io: planet2, filename: 'nes.png', content_type: 'image/jpg')
planet_2.photos.attach(io: planet22, filename: 'nes.png', content_type: 'image/jpg')
planet_2.photos.attach(io: planet23, filename: 'nes.png', content_type: 'image/jpg')
planet_2.photos.attach(io: planet24, filename: 'nes.png', content_type: 'image/jpg')


planet3 = URI.open('https://static.wikia.nocookie.net/starwars/images/6/6d/Scarif_SWCT.png/revision/latest?cb=20181010053537')
planet32 = URI.open('https://static.wikia.nocookie.net/starwars/images/4/49/Shield_Gate-SW_Battlefront.png/revision/latest?cb=20161218064022')
planet33 = URI.open('https://angrystaffofficer.files.wordpress.com/2016/12/rogue-one-a-star-wars-story-trailer-3-scarif.jpg?w=1000&h=414&crop=1')
planet34 = URI.open('https://cdnb.artstation.com/p/assets/images/images/004/230/583/medium/patrick-gladys-patrickgladys-22fix.jpg?1481568074')

planet_3 = Planet.create(name: 'Scarif',
                        radius: Faker::Number.number(digits: 5),
                        atmosphere:  ATMOSPHERES.sample,
                        temperature: Faker::Number.decimal(l_digits: 2),
                        description: 'Scarif is the Miami of the planets, the biggest party planet there is. You can normally only go from May until Juli, because otherwise it is to hot !!!',
                        galaxy: GALAXIES.sample,
                        price: Faker::Number.number(digits: 4),
                        owner: User.last,
)

planet_3.photos.attach(io: planet3, filename: 'nes.png', content_type: 'image/jpg')
planet_3.photos.attach(io: planet32, filename: 'nes.png', content_type: 'image/jpg')
planet_3.photos.attach(io: planet33, filename: 'nes.png', content_type: 'image/jpg')
planet_3.photos.attach(io: planet34, filename: 'nes.png', content_type: 'image/jpg')
