require "open-uri"
require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database... lets gooooooo 🗑🕺"
Travel.destroy_all
puts "Travels destroyed ✅"
Booking.destroy_all
puts "Bookings destroyed ✅"
Activity.destroy_all
puts "Activities destroyed ✅"
User.destroy_all
puts "Users destroyed ✅"

puts 'Creating users...'

user1 = { first_name: "Caroline", last_name: "Gognet", company: "Softbank", job_title: "fullstack developer", industry: "Bank/Insurane", bio: "Hi I am Caroline. I live and work in Japan since 2019. I am a fullstack developer at Softbank in Tokyo. I am passionate about tech and love meeting new people", country: "Japan", age: "36", years_exp: "12", email: "caroline@stork.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/89100834?v=4" }

user2 = { first_name: "Amelie", last_name: "Patin", company: "Accor", job_title: "product manager", industry: "Hospitality", bio: "I am Amélie, a PM based in Paris. I love Portugal, visiting cities and eating pastries. My dream is to open my own pastry shop one day !", country: "France", age: "35", years_exp: "12", email: "amelie@stork.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633340679/pyt6x9r7vu6fi9lq9ajs.jpg" }

user3 = { first_name: "Yasmine", last_name: "Berrada", company: "Fairphone", job_title: "product manager", industry: "Tech", bio: "I am Yasmine, I live in Amsterdam and I am passionate about tech products. I love Japan. I am looking for buddies to go to museums and art exhibitions when I travel for work.", country: "Netherland", age: "30", years_exp: "8", email: "yasmine@stork.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/66015592?v=4" }

user4 = { first_name: "Sam", last_name: "Rozenberg", company: "Meta", job_title: "fullstack developer", industry: "Tech", bio: "I am Sam, I live in Palo Alto where I am a fullstack developer at Meta. I'm interested in IoT, cryptos and cognitive neurosciences. I love Portugal and Japan.", country: "USA", age: "25", years_exp: "2", email: "sam@meta.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/90610969?v=4" }

user5 = { first_name: "Sola", last_name: "Fragosso", company: "IBM", job_title: "sales op", industry: "Tech", bio: "Hello this is Sola ! I am a sales op at IBM in New York. I love dancing and singing. I'm looking for buddies to go out for dinners when I travel for work.", country: "USA", age: "38", years_exp: "15", email: "sola@gmail.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/90733671?v=4" }

user6 = { first_name: "Jason", last_name: "Mancini", company: "Google", job_title: "design & user research", industry: "Tech", bio: "I am Jason, a designer at Google specialized in user research. What you should know about me is that I am a crazy dancer ! Always ready to learn new dance steps.", country: "Ireland", age: "29", years_exp: "5", email: "jason@gmail.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/87811770?v=4" }

user7 = { first_name: "Karim", last_name: "Kattan", company: "Doctolib", job_title: "designer UX-UI", industry: "Tech", bio: "I am Karim, I work at Doctolib in Paris where I am a UX-UI designer. I love cooking and having good meals with friends. Very excited about learning new recipes while traveling.", country: "France", age: "31", years_exp: "8", email: "karim@gmail.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/82041994?v=4" }

user8 = { first_name: "Yukio", last_name: "Mishima", company: "Sony", job_title: "designer UX-UI", industry: "Tech", bio: "I am Yukio, UX-UI designer at Sony in Tokyo. I am looking for buddies to go clubbing and taking dance lessons ! I also love to visit cities and monuments.", country: "Japan", age: "35", years_exp: "12", email: "yukio@gmail.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/86800328?v=4" }


[user1, user2, user3, user4, user5, user6, user7, user8].each do |attributes|
  user = User.new(attributes)
  user.photo.attach(io: URI.open(attributes[:photo]), filename: "#{user.first_name}#{user.last_name}.png", content_type: "image/jpg")
  user.hobby_list.add(["Sports", "Nature", "Visiting", "Food", "Bars", "Tech", "Arts", "Crafts", "Dancing", "Singing", "Shopping"].sample(8))
  user.save
  puts "Created #{user.first_name}"
end



puts 'Creating 99 men --- oh yeahhhh lets go... Devinette: I can fly but have no wings. I can cry but I have no eyes. Wherever I go, darkness follows me. What am I? ❓❓❓🔑 '
picture_id = 1
99.times do
  user = User.new(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    company: Faker::Company.name,
    job_title: ["Developer", "Accountant", "Account Manager", "Investor", "Manager", "Event Planner", "Director of Operations"].sample,
    industry: ["Tech/IT", "Food", "Bank/Assurance", "Hospitality", "Renewable Energy"].sample,
    bio: ["I love bitcoin", "Hello, I am very kind and super cool", "I love football", "I like to talk and spend time with friends!", "I love to meet up new people. Feel free to contact me!", "Travelling is my hobby, I love my job because I travel everywhere around the world."].sample,
    country: Faker::Address.country,
    age: rand(28..60),
    years_exp: rand(3..20),
    password: "hellostork",
    password_confirmation: "hellostork"
  )
  user.email = "#{user.first_name}.#{user.last_name}@gmail.com"
  user.photo.attach(io: URI.open("https://randomuser.me/api/portraits/men/#{picture_id}.jpg"), filename: "#{user.first_name}#{user.last_name}.png", content_type: "image/jpg")
  user.hobby_list.add(["Sports", "Nature", "Visiting", "Food", "Bars", "Tech", "Arts", "Crafts", "Dancing", "Singing", "Shopping"].sample(8))
  user.save
  picture_id += 1
  puts "Created #{user.first_name} 🧑‍🦱"
end
puts 'Finished!'

puts 'Creating 99 women --- it takes a long time :( sit down and relax ! You still have 2 minutes to find the answer if you havent found it yet.'
picture_id_woman = 1
99.times do
  user = User.new(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    company: Faker::Company.name,
    job_title: ["Developer", "Accountant", "Account Manager", "Investor", "Manager", "Event Planner", "Director of Operations"].sample,
    industry: ["Tech/IT", "Food", "Bank/Assurance", "Hospitality", "Renewable Energy"].sample,
    bio: ["I love bitcoin", "Hello, I am very kind and super cool", "I love football and danse", "I like to talk and spend time with friends!", "I love to meet up new people. Feel free to contact me!", "Travelling is my hobby, I love my job because I travel everywhere around the world."].sample,
    country: Faker::Address.country,
    age: rand(28..60),
    years_exp: rand(3..20),
    password: "hellostork",
    password_confirmation: "hellostork"
  )
  user.email = "#{user.first_name}.#{user.last_name}@gmail.com"
  user.photo.attach(io: URI.open("https://randomuser.me/api/portraits/men/#{picture_id_woman}.jpg"), filename: "#{user.first_name}#{user.last_name}.png", content_type: "image/jpg")
  user.hobby_list.add(["Sports", "Nature", "Visiting", "Food", "Bars", "Tech", "Arts", "Crafts", "Dancing", "Singing", "Shopping"].sample(8))
  user.save
  picture_id += 1
  puts "Created #{user.first_name} 👩‍🦰"
end


puts "Creating activities... THE ANSWER IS... ‼️ wait 10 more seconds..."

activity1 = { name: "Visiting Sintra", category: "Visiting", place: "Sintra, Lisbon, Portugal", description: "Let's go on a day trip to Sintra to visit the Palaces. Who wants to join ? :)", owner_id: User.find_by_first_name('Amelie').id, capacity_max: "10", start_date: DateTime.new(2021,11,26,17), end_date: DateTime.new(2021,11,26,17), photo: "https://images.unsplash.com/photo-1562195168-c82fea0f0953?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2ludHJhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60" }

activity2 = { name: "The pastry tour : tasting typical Lisbon egg tarts in Alfama", category: "Food", place: "Alfama, Lisbon, Portugal", description: "If you too love pastries, join me on a tour of all the pastries in Alfama. The goal is to taste the best pasteis de nata to choose our favorite. Ready ?", owner_id: User.find_by_first_name('Amelie').id, capacity_max: "8", start_date: DateTime.new(2021,11,29,11), end_date: DateTime.new(2021,11,29,13), photo: "https://media.istockphoto.com/photos/portugal-egg-tart-with-azulejo-picture-id1124635330?b=1&k=20&m=1124635330&s=170667a&w=0&h=PbHCGQhL-kaB7Q8Ya1TXKrWe6uOLRE5woiAmSUWdbpU=" }

activity3 = { name: "Learning Fado with Lourenço and Carla - singing lesson", category: "Singing", place: "Chiado, Lisbon, Portugal", description: "For music and singing lovers, I suggest you join me for a great Fado course for beginners with artists Lourenço and Carla. I met them during my last stay in Lisbon and promised myself to discover Fado with them on my next stay. There are only six spots for this session so don't wait to register!", owner_id: User.find_by_first_name('Jason').id, capacity_max: "30", start_date: DateTime.new(2021,11,26,14), end_date: DateTime.new(2021,11,26,17), photo: "https://media.istockphoto.com/photos/band-performing-traditional-music-fado-under-pergola-with-azulejos-in-picture-id1064650996?b=1&k=20&m=1064650996&s=170667a&w=0&h=GH90-V2xVAO_cTwgFSeZWc_mICTH8WCAT7eivprukKY=" }

activity4 = { name: "Cooking class with Bruna", category: "Food", place: "Belém, Lisbon, Portugal", description: "An event not to be missed! I suggest you come with me for a cooking class with chef Bruna in the heart of the Bélem district. We will learn to cook nine typical dishes that we will then share during a dinner accompanied by good local wines. The class takes place in Bruna's restaurant. Here is the list of dishes that we will learn to cook: Bacalhau com Natas, Arroz de Marisco, Dourada Grelhada, Bacalhau in Brás, Bife a Café, Carne by Porco Alentejana, Sardinhas Assadas, Arroz de Pato, Arroz de Tamboril.", owner_id: User.find_by_first_name('Jason').id, capacity_max: "4", start_date: DateTime.new(2021,12,1,9), end_date: DateTime.new(2021,12,1,15), photo: "https://images.unsplash.com/photo-1549590143-d5855148a9d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y29va2luZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" }

activity5 = { name: "Networking event for tech people in Bairro Alto", category: "Tech", place: "Bairro Alto, Lisbon, Portugal", description: "With my amazing workmates at Softbank,Tokyo, we organize a dev&tech gathering in a bar in Bairro Alto this saturday night. Come join us for a crazy night out !", owner_id: User.find_by_first_name('Caroline').id, capacity_max: "30", start_date: DateTime.new(2021,11,30,20), end_date: DateTime.new(2021,12,1,2), photo: "https://media.istockphoto.com/photos/casual-catering-discussion-meeting-colleagues-concept-picture-id597940046?b=1&k=20&m=597940046&s=170667a&w=0&h=GSqvi2bfqWORR4PUTkzh4j1AcXK3katN4ml5MpkqnWo=" }

activity6 = { name: "Visiting Nara : culture and history", category: "Visiting", place: "Nara, Japan", description: "Come visit Nara with me this weekend !", owner_id: User.find_by_first_name('Yasmine').id, capacity_max: "40", start_date: DateTime.new(2021,12,2,9), end_date: DateTime.new(2021,12,2,21), photo: "https://images.unsplash.com/photo-1537153725174-cba5e5e81ab0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmFyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" }

activity7 = { name: "Crazy night in Shibuya : bars !", category: "Bars", place: "Shibuya, Tokyo, Japan", description: "Let's paint the town red. Our challenge tonight ? Have a drink in every bar at Shibuya.", owner_id: User.find_by_first_name('Yasmine').id, capacity_max: "10", start_date: DateTime.new(2021,12,1,18), end_date: DateTime.new(2021,12,2,7), photo: "https://images.unsplash.com/photo-1542052125323-e69ad37a47c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hpYnV5YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" }

activity8 = { name: "Shopping in Akihabara", category: "Shopping", place: "Akihabara, Tokyo, Japan", description: "Wanna buy some brand new games, Sonic Cosplays, gadgets ? Let's go to Akihabara on sunday :):)", owner_id: User.find_by_first_name('Sam').id, capacity_max: "5", start_date: DateTime.new(2021,12,1,15), end_date: DateTime.new(2021,12,1,19), photo: "https://media.istockphoto.com/photos/akihabara-tokyo-japan-picture-id468356740?b=1&k=20&m=468356740&s=170667a&w=0&h=kLkcA2hevgkassPl_1rWOPbRpLaZuzarV7KHlD3LH2g=" }

activity9 = { name: "Samba ! Dance lessons with Ricardo and Manuela", category: "Dancing", place: "Rio de Janeiro, Brazil", description: "I love dancing and am really excited about learning the basics of Samba with Ricardo and Manuela ! I met them during Carnival and they proposed to teach me some steps. Wanna join ?", owner_id: User.find_by_first_name('Yukio').id, capacity_max: "60", start_date: DateTime.new(2021,12,2,18), end_date: DateTime.new(2021,12,2,22), photo: "https://media.istockphoto.com/photos/couple-dancers-practicing-in-studio-holding-hands-picture-id1264865152?b=1&k=20&m=1264865152&s=170667a&w=0&h=Hd2LdgDMsfhenPsHtAJuv7h4QdbW1qLrcJbQZEV06HA=" }

activity10 = { name: "The blockchain Job Fair in Hong Kong", category: "Tech", place: "5 Connaught Rd Central, Central, Hong Kong", description: "Are you looking for the opportunity of your dreams in Data or Blockchain technologies? This unique event is for you! Register quickly as places are limited and we will not be able to accept all registrations 👨🏼‍🎓", owner_id: User.find_by_first_name('Karim').id, capacity_max: "100", start_date: DateTime.new(2021,12,2,8), end_date: DateTime.new(2021,12,2,18), photo: "https://media.istockphoto.com/photos/bitcoin-network-concept-on-digital-screen-picture-id1297465792?b=1&k=20&m=1297465792&s=170667a&w=0&h=w4ADFjvxsfswEwKcsX1QZNVlBaXmPyYbzF13iuUggm0=" }

activity11 = { name: "Giant basketball tournament in Hong Kong", category: "Sports", place: "2 Tse Wai Ave, Ngau Chi Wan, Hong Kong", description: "For basketball fans! Come and participate in our giant basketball tournament on a legendary court overlooking the city of Hong Kong. We'll have a drink at the end of the tournament;)", owner_id: User.find_by_first_name('Karim').id, capacity_max: "40", start_date: DateTime.new(2021,12,2,16), end_date: DateTime.new(2021,12,2,22), photo: "https://images.unsplash.com/photo-1465509419584-d2b0ff1ce390?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJhc2tldGJhbGwlMjBob25nJTIwa29uZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" }

activity12 = { name: "Ping Pong", category: "Sports", place: "Campo dos Mártires da Pátria, Lisbon", description: "Don't miss this crazy event for ping pong lovers ! If you like to ping, if you like to pong. Be there !", owner_id: User.find_by_first_name('Caroline').id, capacity_max: "20", start_date: DateTime.new(2021,11,26,16), end_date: DateTime.new(2021,11,26,22), photo: "https://images.unsplash.com/photo-1593786481097-cf281dd12e9e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGluZyUyMHBvbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60" }

activity13 = { name: "Olympiades du Wagon Lisboa", category: "Bars", place: "R. Dom Pedro V 89, 1250-093 Lisbon", description: "Come and test yourself against the best Ruby developers in Lisbon, the students at Le Wagon! Bag races, blind tests, surfing, beer pong: get ready !", owner_id: User.find_by_first_name('Sam').id, capacity_max: "30", start_date: DateTime.new(2021,11,26,16), end_date: DateTime.new(2021,11,26,22), photo: "https://media.istockphoto.com/photos/taking-aim-to-shoot-picture-id497960796?b=1&k=20&m=497960796&s=170667a&w=0&h=zQa5vznMz38sZM5JgrDpHJZx_3_vj5N_bDa2Z1uHldw=" }

activity14 = { name: "Biggest bacalhau eater contest", category: "Food", place: "Jardim do Príncipe Real, Lisbon", description: "Do you like fish? So much the better because in this event you will eat it like never before. In all the sauces and in all its forms, it will be the cod festival ! Viva bacalhau", owner_id: User.find_by_first_name('Yasmine').id, capacity_max: "20", start_date: DateTime.new(2021,11,26,16), end_date: DateTime.new(2021,11,26,22), photo: "https://media.istockphoto.com/photos/dried-codfish-picture-id1130773985?b=1&k=20&m=1130773985&s=170667a&w=0&h=D3tEKGIFvvTLYcQA6Xe8L9efDsJbuYLFc77kQo0HCN4=" }

activity15 = { name: "Breakfast at Pokawa", category: "Food", place: "R. da Misericórdia 71, Lisbon", description: "Join Karim for a delicious breakfast at Pokawa. Never enough poké 🙈. Miam Délish.", owner_id: User.find_by_first_name('Karim').id, capacity_max: "8", start_date: DateTime.new(2021,11,26,8), end_date: DateTime.new(2021,11,26,9), photo: "https://media.istockphoto.com/photos/dried-codfish-picture-id1130773985?b=1&k=20&m=1130773985&s=170667a&w=0&h=D3tEKGIFvvTLYcQA6Xe8L9efDsJbuYLFc77kQo0HCN4=" }

[activity1, activity2, activity3, activity4, activity5, activity6, activity7, activity8, activity9, activity10, activity11, activity12, activity13, activity14, activity15].each_with_index do |attributes, index|
  activity = Activity.new(attributes)
  activity.photo.attach(io: URI.open(attributes[:photo]), filename: "#{activity.owner_id}_#{index}.jpg", content_type: "image/jpg")
  activity.save
  puts "Created #{activity.name} 🌉"
end

puts "Creating bookings..."
booking1 = { user_id: User.find_by_first_name('Sam').id, activity_id: Activity.find_by_name('Visiting Sintra').id }
booking2 = { user_id: User.find_by_first_name('Yukio').id, activity_id: Activity.find_by_name('Visiting Sintra').id }

[booking1, booking2].each do |attributes|
  booking = Booking.create!(attributes)
  puts "Created #{booking.id}"
end

puts "Finished!"

puts 'Creating 90 bookings for the activity -- The blockchain job fair...'
User.all.sample(90).each do |user|
  booking = Booking.new(
    activity: Activity.find_by_name('The blockchain Job Fair in Hong Kong'),
    user: user
  )
  booking.save!
end

puts 'Creating 35 bookings for the activity -- Giant basketball tournament in Hong Kong...'
User.all.sample(35).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Giant basketball tournament in Hong Kong').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 51 bookings for the activity -- Samba ! Dance lessons with Ricardo and Manuela...'
User.all.sample(51).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Samba ! Dance lessons with Ricardo and Manuela').id,
    user_id: user.id
  )
  booking.save!
end

# 51.times do
#   booking = Booking.new(
#     activity_id: Activity.find_by_name('Samba ! Dance lessons with Ricardo and Manuela').id,
#     user_id: User.all.sample.id
#   )
#   booking.save
# end

puts 'Creating 38 bookings for the activity -- Visiting Nara : culture and history...'

User.all.sample(38).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Visiting Nara : culture and history').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 25 bookings for the activity -- Learning Fado with Lourenço and Carla - singing lesson...'

User.all.sample(25).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Learning Fado with Lourenço and Carla - singing lesson').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Finished!'

puts "❌The answer is...❌"
puts "5"
sleep(1)
puts "4"
sleep(1)
puts "3"
sleep(1)
puts "2"
sleep(1)
puts "1"
sleep(1)
puts "..."
sleep(1)
puts "..."
sleep(1)
puts "..."
sleep(1)

puts "A CLOUD ! ☁"

sleep(1)

puts "Congrats if you found it ! ✅🤪"




# if user.first_name == []
#   user.photo.attach(io: URI.open(user_pictures_url.sample), filename: "#{user.name}.png", content_type: 'image/png')
