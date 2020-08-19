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

puts "lets go go go"

book_isbns = ("9780007123810,9780007123827,9780007129706,9780007129720,9780007144082,9780007149131,9780007149148,9780007149216,9780007149230,9780007149247,9780007171972,9780007171996,9780007172009,9780007182367,9780007203604").split(",")
book_isbns1 = ("9780449213940,9780553212419,9781616897987,9783836565547,9783836560146,9783836535960,9783836560429,9781514682050").split(",")
book_isbns2 = ("9780545010221,9780590353427,9780747532743,9780747532743,8498386314").split(",")
book_isbns = book_isbns+book_isbns2+book_isbns1
records=book_isbns.map{|record|BookRecord.populate(record)}
creation_line=records.each{|record|BookRecord.find_or_create_by(record)}

results=BookRecord.populate_by_author("rowling")
# binding.pry
results=results.map{|b|{title:b["title"],author: b["authors"],synopsis:(b["synopsis"] ? b["synopsis"] : "The synopsis is not available"), img_url:b["image"],isbn13:b["isbn13"], isbn:b["isbn"]}}
results.each{|record|BookRecord.find_or_create_by(record)}

users="greg,alexS,Tashawn,IanG,James,IanR,Jennifer,Alex,Junko,RyanW,Karan,SeMin,JakeL,Brian,Devin,Muhtasim,Josh,DavidKir,Amit,JakeM,Victor,Kevin,RyanF,Vincent,DavidK,Ward,Codyd,RyanL,Matthew,Gregory,Codyc,Mimi,Minelie,Joseph,Samuel,Sawandi,Iuri,Jzavier,Israel,Vlad,Teddy"
users=users.split(",")
users.each{|u|User.create(name:u, password_digest:"1234",email:"#{u}@flat.com")}

pergolas=[{
    name: Faker::Games::Witcher.location,
    address1: "233 Spring Street",
    address2: nil,
    city: "New York City",
    state: "New York",
    zip_code: 10013
},
{
    name: Faker::Games::Witcher.location,
    address1: "11115 75th Ave",
    address2: nil,
    city: "Flushing",
    state: "New York",
    zip_code: 11375
},
{
    name: Faker::Games::Witcher.location,
    address1: "285 Park Ave",
    address2: nil,
    city: "New York City",
    state: "New York",
    zip_code: 10171
},
{
    name: Faker::Games::Witcher.location,
    address1: "11 martine avenue",
    address2: nil,
    city: "White Plains",
    state: "New York",
    zip_code: 10606
},
{
    name: Faker::Games::Witcher.location,
    address1: "24056 65th Ave",
    address2: nil,
    city: "Douglaston",
    state: "New York",
    zip_code: 11362
}
]

pergolas.each{|p|Pergola.create!(p)}

500.times do
    Book.create(book_record_id:BookRecord.all.sample.id,pergola_id:Pergola.all.sample.id,user_id:User.all.sample.id, count:rand(50..100))
end

# binding.pry

p BookRecord.count
p Pergola.count
p User.count
p Book.count
puts "cash Money"


# binding.pry
# 0

