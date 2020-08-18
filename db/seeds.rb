# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'pry'
require 'dotenv'
require 'rest-client'
Dotenv.load

# 20.times do
#     BookRecord.create(title:Faker::Book.title, author:Faker::Book.author , synopsis:Faker::Book.publisher, img_url:Faker::Book.genre)
# end

puts "lets go go go"

book_isbns = ("9780007123810,9780007123827,9780007129706,9780007129720,9780007144082,9780007149131,9780007149148,9780007149216,9780007149230,9780007149247,9780007171972,9780007171996,9780007172009,9780007182367,9780007203604").split(",")
book_isbns1 = ("9780449213940,9780553212419,9781616897987,9783836565547,9783836560146,9783836535960,9783836560429,9781514682050").split(",")
book_isbns2 = ("9780545010221,9780590353427,9780747532743,9780747532743,8498386314").split(",")
book_isbns = book_isbns+book_isbns2+book_isbns1
records=book_isbns.map{|record|BookRecord.populate(record)}
creation_line=records.each{|record|BookRecord.find_or_create_by(record)}

users="greg,alexS,Tashawn,IanG,James,IanR,Jennifer,Alex,Junko,RyanW,Karan,SeMin,JakeL,Brian,Devin,Muhtasim,Josh,DavidKir,Amit,JakeM,Victor,Kevin,RyanF,Vincent,DavidK,Ward,Codyd,RyanL,Matthew,Gregory,Codyc,Mimi,Minelie,Joseph,Samuel,Sawandi,Iuri,Jzavier,Israel,Vlad,Teddy"
users=users.split(",")
users.each{|u|User.create(name:u)}

5.times do
    Pergola.create(name: Faker::Games::Witcher.location)
end

60.times do
    Book.create(count:rand(20..50),book_record_id:BookRecord.all.sample.id,pergola_id:Pergola.all.sample.id,user_id:User.all.sample.id)
end

# binding.pry
p BookRecord.count
p Pergola.count
p User.count
p Book.count

puts "cash Money"


# binding.pry
# 0

