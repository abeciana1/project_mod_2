# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'pry'
# 60.times do
#     BookRecord.create(title:Faker::Book.title, author:Faker::Book.author , synopsis:Faker::Book.publisher, img_url:Faker::Book.genre)
# end

# users="greg,alexS,Tashawn,IanG,James,IanR,Jennifer,Alex,Junko,RyanW,Karan,SeMin,JakeL,Brian,Devin,Muhtasim,Josh,DavidKir,Amit,JakeM,Victor,Kevin,RyanF,Vincent,DavidK,Ward,Codyd,RyanL,Matthew,Gregory,Codyc,Mimi,Minelie,Joseph,Samuel,Sawandi,Iuri,Jzavier,Israel,Vlad,Teddy"
# users=users.split(",")
# users.each{|u|User.create(name:u)}

# 5.times do
#     Pergola.create(name: Faker::Games::Witcher.location)
# end

# 60.times do
#     Book.create(count:rand(20..50),book_record_id:BookRecord.all.sample.id,pergola_id:Pergola.all.sample.id,user_id:User.all.sample.id)
# end

p BookRecord.count
p Pergola.count
p Book.count
p User.count



# binding.pry
# 0

