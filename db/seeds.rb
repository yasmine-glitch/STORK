require "open-uri"
require "faker"

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

user1 = { first_name: "Caroline", last_name: "Gognet", company: "Softbank", job_title: "fullstack developer", industry: "Bank/Insurance", bio: "Hi I am Caroline. I am Mexican but live and work in Japan since 2019. I am a fullstack developer at Softbank in Tokyo. I am passionate about tech, cryptos and real estate investments. I'm on Stork to meet people that will make me discover new interests and enjoy my free time keeping meeting interesting people ", country: "Japan", age: "31", years_exp: "12", email: "caroline@stork.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/89100834?v=4" }

user2 = { first_name: "Amelie", last_name: "Patin", company: "Accor", job_title: "Product Manager", industry: "Hospitality", bio: "I am Amélie, a PM based in Paris. I love Portugal, visiting cities and eating pastries. My dream is to open my own pastry shop one day !", country: "France", age: "35", years_exp: "12", email: "amelie@stork.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1633340679/pyt6x9r7vu6fi9lq9ajs.jpg" }

user3 = { first_name: "Yasmine", last_name: "Berrada", company: "Fairphone", job_title: "Product Manager", industry: "Tech", bio: "I am Yasmine, I live in Amsterdam and I am passionate about tech products. I love Japan. I am looking for buddies to go to museums and art exhibitions when I travel for work.", country: "Netherland", age: "30", years_exp: "8", email: "yasmine@stork.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/66015592?v=4" }

user4 = { first_name: "Sam", last_name: "Rozenberg", company: "Meta", job_title: "Fullstack developer", industry: "Tech", bio: "I am Sam, I live in Palo Alto where I am a fullstack developer at Meta. I'm interested in IoT, cryptos and cognitive neurosciences. I love Portugal and Japan.", country: "USA", age: "25", years_exp: "2", email: "sam@meta.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/90610969?v=4" }

user5 = { first_name: "Sola", last_name: "Fragosso", company: "IBM", job_title: "Sales Op", industry: "Tech", bio: "Hello this is Sola ! I am a sales op at IBM in New York. I love dancing and singing. I'm looking for buddies to go out for dinners when I travel for work.", country: "USA", age: "38", years_exp: "15", email: "sola@gmail.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/90733671?v=4" }

user6 = { first_name: "Jason", last_name: "Mancini", company: "Google", job_title: "Design & User Research", industry: "Tech", bio: "I am Jason, a designer at Google specialized in user research. What you should know about me is that I am a crazy dancer ! Always ready to learn new dance steps.", country: "Ireland", age: "29", years_exp: "5", email: "jason@gmail.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/87811770?v=4" }

user7 = { first_name: "Karim", last_name: "Kattan", company: "Doctolib", job_title: "Designer UX-UI", industry: "Tech", bio: "I am Karim, I work at Doctolib in Paris where I am a UX-UI designer. I love cooking and having good meals with friends. Very excited about learning new recipes while traveling.", country: "France", age: "31", years_exp: "8", email: "karim@gmail.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/82041994?v=4" }

user8 = { first_name: "Yukio", last_name: "Mishima", company: "Sony", job_title: "Designer UX-UI", industry: "Tech", bio: "I am Yukio, UX-UI designer at Sony in Tokyo. I am looking for buddies to go clubbing and taking dance lessons ! I also love to visit cities and monuments.", country: "Japan", age: "35", years_exp: "12", email: "yukio@gmail.com", password: "hellostork", password_confirmation: "hellostork", photo: "https://avatars.githubusercontent.com/u/86800328?v=4" }


[user1, user2, user3, user4, user5, user6, user7, user8].each do |attributes|
  user = User.new(attributes)
  user.photo.attach(io: URI.open(attributes[:photo]), filename: "#{user.first_name}#{user.last_name}.png", content_type: "image/jpg")
  user.hobby_list.add(["Sports", "Nature", "Visiting", "Food", "Bars", "Tech", "Arts", "Crafts", "Dancing", "Singing", "Shopping"].sample(5))
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
    industry: ["Tech/IT", "Food", "Bank/Insurance", "Hospitality", "Renewable Energy", "Automotive"].sample,
    bio: ["I love sports, I practice tennis and running. I'm here to meet new people and enjoy my free time while traveling", "Hello, I have 2 children and I am keen of cryptos. Let's meet to dicuss about business!", "I love discovering new culture but I hate doing it alone, let's meet!", "I like to talk and spend time with people! I am keen of new technologies and would like to discuss with some pros about it :)", "I love to meet up new people. Feel free to contact me!", "Travelling is my hobby, I love my job because I travel everywhere around the world. I'm here because I'd like to share exxperiences with people and share ideas about business."].sample,
    country: Faker::Address.country,
    age: rand(25..40),
    years_exp: rand(3..20),
    password: "hellostork",
    password_confirmation: "hellostork"
  )
  user.email = "#{user.first_name}.#{user.last_name}@gmail.com"
  user.photo.attach(io: URI.open("https://randomuser.me/api/portraits/men/#{picture_id}.jpg"), filename: "#{user.first_name}#{user.last_name}.png", content_type: "image/jpg")
  user.hobby_list.add(["Sports", "Nature", "Visiting", "Food", "Bars", "Tech", "Arts", "Crafts", "Dancing", "Singing", "Shopping"].sample(5))
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
    bio: ["I love sports, I practice tennis and running. I'm here to meet new people and enjoy my free time while traveling", "Hello, I have 2 children and I am keen of cryptos. Let's meet to dicuss about business!", "I love discovering new culture but I hate doing it alone, let's meet!", "I like to talk and spend time with people! I am keen of new technologies and would like to discuss with some pros about it :)", "I love to meet up new people. Feel free to contact me!", "Travelling is my hobby, I love my job because I travel everywhere around the world. I'm here because I'd like to share exxperiences with people and share ideas about business."].sample,
    country: Faker::Address.country,
    age: rand(28..60),
    years_exp: rand(3..20),
    password: "hellostork",
    password_confirmation: "hellostork"
  )
  user.email = "#{user.first_name}.#{user.last_name}@gmail.com"
  user.photo.attach(io: URI.open("https://randomuser.me/api/portraits/women/#{picture_id_woman}.jpg"), filename: "#{user.first_name}#{user.last_name}.png", content_type: "image/jpg")
  user.hobby_list.add(["Sports", "Nature", "Visiting", "Food", "Bars", "Tech", "Arts", "Crafts", "Dancing", "Singing", "Shopping"].sample(5))
  user.save
  picture_id_woman += 1
  puts "Created #{user.first_name} 👩‍🦰"
end


puts "Creating activities... THE ANSWER IS... ‼️ wait 10 more seconds..."

activity1 = { name: "Visiting Sintra", category: "Visiting", place: "Sintra, Lisbon, Portugal", description: "Let's go on a day trip to Sintra to visit the Palaces. Who wants to join ? :)", owner_id: User.find_by_first_name('Amelie').id, capacity_max: "10", start_date: DateTime.new(2021,12,4,9), end_date: DateTime.new(2021,12,4,17), photo: "https://images.unsplash.com/photo-1562195168-c82fea0f0953?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2ludHJhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60" }

activity2 = { name: "The pastry tour : tasting typical Lisbon egg tarts in Alfama", category: "Food", place: "Alfama, Lisbon, Portugal", description: "If you too love pastries, join me on a tour of all the pastries in Alfama. The goal is to taste the best pasteis de nata to choose our favorite. Ready ?", owner_id: User.find_by_first_name('Amelie').id, capacity_max: "8", start_date: DateTime.new(2021,12,5,14), end_date: DateTime.new(2021,12,5,16), photo: "https://media.istockphoto.com/photos/portugal-egg-tart-with-azulejo-picture-id1124635330?b=1&k=20&m=1124635330&s=170667a&w=0&h=PbHCGQhL-kaB7Q8Ya1TXKrWe6uOLRE5woiAmSUWdbpU=" }

activity3 = { name: "Learning Fado with Lourenço and Carla - singing lesson", category: "Singing", place: "Chiado, Lisbon, Portugal", description: "For music and singing lovers, I suggest you join me for a great Fado course for beginners with artists Lourenço and Carla. I met them during my last stay in Lisbon and promised myself to discover Fado with them on my next stay. There are only six spots for this session so don't wait to register!", owner_id: User.find_by_first_name('Jason').id, capacity_max: "30", start_date: DateTime.new(2021,12,4,14), end_date: DateTime.new(2021,12,4,17), photo: "https://media.istockphoto.com/photos/band-performing-traditional-music-fado-under-pergola-with-azulejos-in-picture-id1064650996?b=1&k=20&m=1064650996&s=170667a&w=0&h=GH90-V2xVAO_cTwgFSeZWc_mICTH8WCAT7eivprukKY=" }

activity4 = { name: "Cooking class with Bruna", category: "Food", place: "Belém, Lisbon, Portugal", description: "An event not to be missed! I suggest you come with me for a cooking class with chef Bruna in the heart of the Bélem district. We will learn to cook nine typical dishes that we will then share during a dinner accompanied by good local wines. The class takes place in Bruna's restaurant. Here is the list of dishes that we will learn to cook: Bacalhau com Natas, Arroz de Marisco, Dourada Grelhada, Bacalhau in Brás, Bife a Café, Carne by Porco Alentejana, Sardinhas Assadas, Arroz de Pato, Arroz de Tamboril.", owner_id: User.find_by_first_name('Jason').id, capacity_max: "4", start_date: DateTime.new(2021,12,5,9), end_date: DateTime.new(2021,12,5,15), photo: "https://images.unsplash.com/photo-1549590143-d5855148a9d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y29va2luZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" }

activity5 = { name: "Networking event for tech people in Bairro Alto", category: "Tech", place: "Bairro Alto, Lisbon, Portugal", description: "With my amazing workmates at Softbank,Tokyo, we organize a dev&tech gathering in a bar in Bairro Alto this saturday night. Come join us for a crazy night out !", owner_id: User.find_by_first_name('Caroline').id, capacity_max: "30", start_date: DateTime.new(2021,12,6,20), end_date: DateTime.new(2021,12,6,2), photo: "https://media.istockphoto.com/photos/casual-catering-discussion-meeting-colleagues-concept-picture-id597940046?b=1&k=20&m=597940046&s=170667a&w=0&h=GSqvi2bfqWORR4PUTkzh4j1AcXK3katN4ml5MpkqnWo=" }

activity6 = { name: "Visiting Nara : culture and history", category: "Visiting", place: "Nara, Japan", description: "Come visit Nara with me this weekend !", owner_id: User.find_by_first_name('Yasmine').id, capacity_max: "40", start_date: DateTime.new(2021,12,2,9), end_date: DateTime.new(2021,12,2,21), photo: "https://images.unsplash.com/photo-1537153725174-cba5e5e81ab0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bmFyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" }

activity7 = { name: "Crazy night in Shibuya : bars !", category: "Bars", place: "Shibuya, Tokyo, Japan", description: "Let's paint the town red. Our challenge tonight ? Have a drink in every bar at Shibuya.", owner_id: User.find_by_first_name('Yasmine').id, capacity_max: "10", start_date: DateTime.new(2021,12,8,18), end_date: DateTime.new(2021,12,9,7), photo: "https://images.unsplash.com/photo-1542052125323-e69ad37a47c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hpYnV5YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" }

activity8 = { name: "Shopping in Akihabara", category: "Shopping", place: "Akihabara, Tokyo, Japan", description: "Wanna buy some brand new games, Sonic Cosplays, gadgets ? Let's go to Akihabara on sunday :):)", owner_id: User.find_by_first_name('Sam').id, capacity_max: "5", start_date: DateTime.new(2021,12,4,15), end_date: DateTime.new(2021,12,4,19), photo: "https://media.istockphoto.com/photos/akihabara-tokyo-japan-picture-id468356740?b=1&k=20&m=468356740&s=170667a&w=0&h=kLkcA2hevgkassPl_1rWOPbRpLaZuzarV7KHlD3LH2g=" }

activity9 = { name: "Samba ! Dance lessons", category: "Dancing", place: "Rio de Janeiro, Brazil", description: "I love dancing and am really excited about learning the basics of Samba with Ricardo and Manuela ! I met them during Carnival and they proposed to teach me some steps. Wanna join ?", owner_id: User.find_by_first_name('Yukio').id, capacity_max: "60", start_date: DateTime.new(2021,12,5,18), end_date: DateTime.new(2021,12,5,22), photo: "https://media.istockphoto.com/photos/couple-dancers-practicing-in-studio-holding-hands-picture-id1264865152?b=1&k=20&m=1264865152&s=170667a&w=0&h=Hd2LdgDMsfhenPsHtAJuv7h4QdbW1qLrcJbQZEV06HA=" }

activity10 = { name: "The blockchain Job Fair in Hong Kong", category: "Tech", place: "5 Connaught Rd Central, Central, Hong Kong", description: "Are you looking for the opportunity of your dreams in Data or Blockchain technologies? This unique event is for you! Register quickly as places are limited and we will not be able to accept all registrations 👨🏼‍🎓", owner_id: User.find_by_first_name('Karim').id, capacity_max: "100", start_date: DateTime.new(2022,01,12,8), end_date: DateTime.new(2022,01,12,18), photo: "https://media.istockphoto.com/photos/bitcoin-network-concept-on-digital-screen-picture-id1297465792?b=1&k=20&m=1297465792&s=170667a&w=0&h=w4ADFjvxsfswEwKcsX1QZNVlBaXmPyYbzF13iuUggm0=" }

activity11 = { name: "Giant basketball tournament in Hong Kong", category: "Sports", place: "2 Tse Wai Ave, Ngau Chi Wan, Hong Kong", description: "For basketball fans! Come and participate in our giant basketball tournament on a legendary court overlooking the city of Hong Kong. We'll have a drink at the end of the tournament;)", owner_id: User.find_by_first_name('Karim').id, capacity_max: "40", start_date: DateTime.new(2021,12,3,16), end_date: DateTime.new(2021,12,3,22), photo: "https://images.unsplash.com/photo-1465509419584-d2b0ff1ce390?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJhc2tldGJhbGwlMjBob25nJTIwa29uZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" }

activity12 = { name: "Morning footing near Tage", category: "Sports", place: "Rua das Janelas Verdes, Lisbon", description: "Join me if you like for a 10kms run from Lisboa to Belem and back in order to enjoy the city while doing some exercise!", owner_id: User.find_by_first_name('Caroline').id, capacity_max: "15", start_date: DateTime.new(2021,12,04,10), end_date: DateTime.new(2021,12,04,12), photo: "https://images.unsplash.com/photo-1551927336-09d50efd69cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80" }

activity13 = { name: "Olympiades du Wagon Lisboa", category: "Bars", place: "R. Dom Pedro V 89, 1250-093 Lisbon", description: "Come and test yourself against the best Ruby developers in Lisbon, the students at Le Wagon! Bag races, blind tests, surfing, beer pong: get ready !", owner_id: User.find_by_first_name('Sam').id, capacity_max: "30", start_date: DateTime.new(2021,12,9,16), end_date: DateTime.new(2021,12,9,22), photo: "https://media.istockphoto.com/photos/taking-aim-to-shoot-picture-id497960796?b=1&k=20&m=497960796&s=170667a&w=0&h=zQa5vznMz38sZM5JgrDpHJZx_3_vj5N_bDa2Z1uHldw=" }

activity14 = { name: "Biggest bacalhau eater contest", category: "Food", place: "Jardim do Príncipe Real, Lisbon", description: "Do you like fish? So much the better because in this event you will eat it like never before. In all the sauces and in all its forms, it will be the cod festival ! Viva bacalhau", owner_id: User.find_by_first_name('Yasmine').id, capacity_max: "20", start_date: DateTime.new(2021,12,5,16), end_date: DateTime.new(2021,12,5,22), photo: "https://media.istockphoto.com/photos/dried-codfish-picture-id1130773985?b=1&k=20&m=1130773985&s=170667a&w=0&h=D3tEKGIFvvTLYcQA6Xe8L9efDsJbuYLFc77kQo0HCN4=" }

activity15 = { name: "Breakfast at Pokawa", category: "Food", place: "R. da Misericórdia 71, Lisbon", description: "Join Karim for a delicious breakfast at Pokawa. Never enough poké 🙈. Miam Délish.", owner_id: User.find_by_first_name('Karim').id, capacity_max: "8", start_date: DateTime.new(2021,12,4,8), end_date: DateTime.new(2021,12,4,9), photo: "https://media.istockphoto.com/photos/dried-codfish-picture-id1130773985?b=1&k=20&m=1130773985&s=170667a&w=0&h=D3tEKGIFvvTLYcQA6Xe8L9efDsJbuYLFc77kQo0HCN4=" }

activity16 = { name: "Horse riding experiences on the way to the stunning Costa de Caparica beach.", category: "Nature", place: "Costa da Caparica beach, Lisbon", description: "We'll board an air-conditioned minivan to reach the starting point of our scenic horseback tour. When we arrive at our starting point, we take in panoramic views of the coast from atop cliffs covered in prehistoric fossils. Then we get on our trusty steed and start exploring the landscape at a gallop.", owner_id: User.all.sample(1)[0].id, capacity_max: "10", start_date: DateTime.new(2021,12,4,10), end_date: DateTime.new(2021,12,4,14), photo: "https://media.istockphoto.com/photos/horseback-riding-on-the-beach-picture-id1051648716?b=1&k=20&m=1051648716&s=170667a&w=0&h=-8PUy70JBBWhGv_faLov_Ot4iBY94ecbJIVKS1wE19o=" }

activity17 = { name: "Small-Group Dolphin Watching Lisbon", category: "Nature", place: "Docas de Santo Amaro, Lisbon", description: "Our main goal is to find dolphins! We leave from Lisbon on a fast rigid inflatable boat. The adventure begins on a speedboat in search of dolphins in the broad Atlantic Ocean. We will get to know the different species of cetaceans and sea birds with an expert marine biologist. For 3 hours, we will live the adventure of searching for wild marine species, such as sunfish, sharks, jellyfish, whales or even sea turtles.", owner_id: User.all.sample(1)[0].id, capacity_max: "6", start_date: DateTime.new(2021,12,5,14), end_date: DateTime.new(2021,12,5,17), photo:"https://images.unsplash.com/photo-1547382442-d17c21625a44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZG9scGhpbiUyMG9ic2VydmF0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60" }

activity18 = { name: "Museu do Azulejos", category: "Arts", place: "Rua da Madre de Deus 4, Lisbon", description: "For a closer look at Lisbon's iconic azulejos, head to the National Azulejo Museum. There we will find many examples of ceramic art from the 15th century to the present day.", owner_id: User.all.sample(1)[0].id, capacity_max: "10", start_date: DateTime.new(2021,12,6,14), end_date: DateTime.new(2021,12,6,17), photo: "https://media.istockphoto.com/photos/old-lisbon-tiles-azulejos-picture-id183584154?b=1&k=20&m=183584154&s=170667a&w=0&h=LQGVZxI9TnrdWP3jjs_tRegbN2MG2rmgHJ1gzJihVAE=" }

activity19 = { name: "Pottery class with Tiago", category: "Crafts", place: "Rua Augusta 164, Lisbon", description: "With 18 years of experience in ceramics, Tiago is a figure in the Lisbon craft landscape. His work is impeccable and neat, his workshop is small and messy. He will guide us in making a ceramic plate, cup, pot and sardine.", owner_id: User.all.sample(1)[0].id, capacity_max: "6", start_date: DateTime.new(2021,12,6,15), end_date: DateTime.new(2021,12,6,18), photo: "https://images.unsplash.com/photo-1529690840038-f38da8894ff6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cG90dGVyeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60" }

activity20 = { name: "Shopping spree in downtown Lisbon!", category: "Shopping", place: "Avenida da Liberdade, Lisbon", description: "Lisbon is a great city to shop! Join me for a friendly trip through the city's best shopping streets. We will start with Avenida da Liberdade then Rua Garrett, then Alfama and finally Rua Augusta.", owner_id: User.all.sample(1)[0].id, capacity_max: "8", start_date: DateTime.new(2021,12,7,14), end_date: DateTime.new(2021,12,7,18), photo: "https://media.istockphoto.com/photos/rua-augusta-and-baixa-lisbon-picture-id531477763?b=1&k=20&m=531477763&s=170667a&w=0&h=qlOvsCEf7RbmFtuFgtzsEnAZYpP8at1OhV0wEITJIhw=" }

activity21 = { name: "We are going to dance ! Salsa, Kizomba", category: "Dancing", place: "Rua Antonio Pedro 40, Arroios, Lisbon", description: "For lovers of Salsa and Kizomba, go for an evening of madness with very very good dancers. Be careful, you need a minimum level in Latin dance to really have fun on the dance floor.", owner_id: User.all.sample(1)[0].id, capacity_max: "20", start_date: DateTime.new(2021,12,3,21), end_date: DateTime.new(2021,12,3,6), photo: "https://images.unsplash.com/photo-1504609813442-a8924e83f76e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2Fsc2F8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60" }

activity22 = { name: "Dinner in Lisbon", category: "Food", place: "Rua da Adiça 58, Lisbon", description: "I propose to have dinner in a nice local restaurant in Lisboa, let's meet and enjoy while networking!", owner_id: User.all.sample(1)[0].id, capacity_max: "6", start_date: DateTime.new(2021,12,3,20), end_date: DateTime.new(2021,12,3,23), photo: "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80" }

activity23 = { name: "Fado night show", category: "Visiting", place: "Rua das Escolas Gerais, Lisbon", description: "Join me to watch a show of a typical portuguese song. You can buy your tickets online www.fadolisbon.com and we meet there 30 minutes before the show", owner_id: User.all.sample(1)[0].id, capacity_max: "5", start_date: DateTime.new(2021,12,3,21), end_date: DateTime.new(2021,12,3,22), photo: "https://media.istockphoto.com/photos/mature-male-guitarist-on-the-stage-picture-id1349231100?b=1&k=20&m=1349231100&s=170667a&w=0&h=qsn-mxEfhddXFcs1uqVJ0MzOSjbNuOMSGXoXZb9PHFo=" }

activity24 = { name: "Lucha libre show", category: "Visiting", place: "Rua Barata Salgueiro 5, Lisbon", description: "Join me to watch a show of lucha libre. It is wrestling and the show looks amazing! You can buy your tickets online www.luchalibrelisbon.com and we meet there 30 minutes before the show", owner_id: User.all.sample(1)[0].id, capacity_max: "10", start_date: DateTime.new(2021,12,3,20), end_date: DateTime.new(2021,12,3,22), photo: "https://images.unsplash.com/photo-1563844528129-067e06a638e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80" }

[activity1, activity2, activity3, activity4, activity5, activity6, activity7, activity8, activity9, activity10, activity11, activity12, activity13, activity14, activity15, activity16, activity17, activity18, activity19, activity20, activity21, activity22, activity23, activity24].each_with_index do |attributes, index|
  activity = Activity.new(attributes)
  activity.photo.attach(io: URI.open(attributes[:photo]), filename: "#{activity.owner_id}_#{index}.jpg", content_type: "image/jpg")
  activity.save
  Chatroom.create(activity: activity, name: "#{activity.name} chat")
  puts "Created #{activity.name} and the dedicated chatroom 🌉"
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
    activity_id: Activity.find_by_name('Samba ! Dance lessons').id,
    user_id: user.id
  )
  booking.save!
end

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

puts 'Creating 14 bookings for the activity -- We are going to dance ! Salsa, Kizomba...'
User.all.sample(14).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('We are going to dance ! Salsa, Kizomba').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 5 bookings for the activity -- Shopping spree in downtown Lisbon!...'
User.all.sample(5).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Shopping spree in downtown Lisbon!').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 5 bookings for the activity -- Pottery class with Tiago...'
User.all.sample(5).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Pottery class with Tiago').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 4 bookings for the activity -- Museu do Azulejos...'
User.all.sample(4).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Museu do Azulejos').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 4 bookings for the activity -- Small-Group Dolphin Watching Lisbon...'
User.all.sample(4).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Small-Group Dolphin Watching Lisbon').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 2 bookings for the activity -- Breakfast at Pokawa....'
User.all.sample(2).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Breakfast at Pokawa').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 8 bookings for the activity -- Biggest bacalhau eater contest....'
User.all.sample(8).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Biggest bacalhau eater contest').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 28 bookings for the activity -- Olympiades du Wagon Lisboa....'
User.all.sample(28).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Olympiades du Wagon Lisboa').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 13 bookings for the activity -- Morning footing near the Tage....'
User.all.sample(13).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Morning footing near Tage').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 8 bookings for the activity -- The pastry tour : tasting typical Lisbon egg tarts in Alfama....'
User.all.sample(8).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('The pastry tour : tasting typical Lisbon egg tarts in Alfama').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 3 bookings for the activity -- Cooking class with Bruna....'
User.all.sample(3).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Cooking class with Bruna').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 26 bookings for the activity -- Networking event for tech people in Bairro Alto....'
User.all.sample(26).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Networking event for tech people in Bairro Alto').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 3 bookings for the activity -- Dinner in Lisbon....'
User.all.sample(3).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Dinner in Lisbon').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 3 bookings for the activity -- Fado night show....'
User.all.sample(3).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Fado night show').id,
    user_id: user.id
  )
  booking.save!
end

puts 'Creating 6 bookings for the activity -- Lucha libre show....'
User.all.sample(6).each do |user|
  booking = Booking.new(
    activity_id: Activity.find_by_name('Lucha libre show').id,
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
