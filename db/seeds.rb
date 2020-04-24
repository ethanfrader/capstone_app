# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(first_name: "Ethan", last_name: "Rader", email: "ethan@example.com", password: "password", profile_picture: "https://pbs.twimg.com/profile_images/1232151681154109440/QMPlCzxF_400x400.jpg")
User.create!(first_name: "Nishat", last_name: "Ahmed", email: "nishat@example.com", password: "password", profile_picture: "https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png")
User.create!(first_name: "Jess", last_name: "Burdeaux", email: "jess@example.com", password: "password", profile_picture: "https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png")
User.create!(first_name: "Payton", last_name: "Kaye", email: "payton@example.com", password: "password", profile_picture: "https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png")
User.create!(first_name: "Luke", last_name: "Smith", email: "luke@example.com", password: "password", profile_picture: "https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png")

puts "users created successfully"

Artist.create!(name: "Ocean Glass", bio: "Ocean Glass is a band that makes music and hopes that you like said music.", location: "Chicago, IL", members: "Nishat, Kyle, Luke, Wes, Ethan", genre: "Indie, pop", email: "oceanglassband@gmail.com")
Artist.create!(name: "Sorner", bio: "Bummer summer", location: "Chicago, IL", members: "Ethan", genre: "Indie, emo", email: "sornerband@gmail.com")
Artist.create!(name: "City Mouth", bio: "A pop punk/indie rock/pop band from the south suburbs of Chicago.", location: "Chicago, IL", members: "Matt, Ryan, Evan, Jess", genre: "Pop punk, indie, pop", email: "citymouthband@example.com")
Artist.create!(name: "Three Story Bungalow", bio: "Chicago-based alternative rock trio. 'In Place' is out on all platforms!", location: "Chicago, IL", members: "Payton, Jeremy, Leo", genre: "Alternative rock", email: "oceanglassband@gmail.com")

puts "artists created successfully"

ArtistUser.create!(user_id: 1, artist_id: 1, privileges: "default")
ArtistUser.create!(user_id: 1, artist_id: 2, privileges: "admin")
ArtistUser.create!(user_id: 2, artist_id: 1, privileges: "admin")
ArtistUser.create!(user_id: 3, artist_id: 3, privileges: "admin")
ArtistUser.create!(user_id: 4, artist_id: 4, privileges: "admin")
ArtistUser.create!(user_id: 5, artist_id: 1, privileges: "default")

puts "artist_users created successfully"

Image.create!(url: "https://f4.bcbits.com/img/0006157563_10.jpg", artist_id: 1)
Image.create!(url: "https://pbs.twimg.com/profile_banners/2287777836/1453701785/1500x500", artist_id: 1)
Image.create!(url: "https://f4.bcbits.com/img/a1894591001_16.jpg", artist_id: 2)
Image.create!(url: "https://s9.limitedrun.com/images/1378755/2019.08.25cmlooks-91.jpg", artist_id: 3)
Image.create!(url: "https://f4.bcbits.com/img/0016441587_10.jpg", artist_id: 4)

puts "images created successfully"

Message.create!(user_id: 1, artist_id: 2, text: "Hey guys, need an opener for your show June 11?", recipient_id: 1)
Message.create!(user_id: 2, artist_id: 1, text: "For sure dude!", recipient_id: 2)
Message.create!(user_id: 1, artist_id: 2, text: "Are you guys doing pre-sale? Expected draw? How many bands on the bill?", recipient_id: 1)
Message.create!(user_id: 1, artist_id: 2, text: "Hey great set! Can I borrow your amp?", recipient_id: 4)

puts "messages created successfully"

MusicLink.create!(artist_id: 1, url: "https://open.spotify.com/artist/4TRhzW4mjVZl1czJ4Sho2j?si=4yPD1ZoBSv2fBT7OipX7KQ")
MusicLink.create!(artist_id: 1, url: "https://oceanglass.bandcamp.com")
MusicLink.create!(artist_id: 2, url: "https://open.spotify.com/artist/6Ovz20wwqxUCaZGrAn6Y0R?si=6aSO-Mj-SFm8Rb0oFZMvcQ")
MusicLink.create!(artist_id: 2, url: "https://sorner.bandcamp.com")
MusicLink.create!(artist_id: 3, url: "https://citymouthil.bandcamp.com")
MusicLink.create!(artist_id: 4, url: "https://threestorybungalow.bandcamp.com")

puts "music_links created successfully"

MediaLink.create!(artist_id: 1, url: "https://www.facebook.com/oceanglassband")
MediaLink.create!(artist_id: 1, url: "https://www.instagram.com/oceanglassband/")
MediaLink.create!(artist_id: 1, url: "https://twitter.com/OceanGlassBand")
MediaLink.create!(artist_id: 2, url: "https://www.facebook.com/sornerband")
MediaLink.create!(artist_id: 2, url: "https://www.instagram.com/sornerband/")

puts "media_links created successfully"

Post.create!(user_id: 2, artist_id: 1, text: "Looking for a couple openers for a big show at HOB in June, slide in the DMs for details!")
Post.create!(user_id: 3, artist_id: 3, text: "Need one more for our CD release show!")

puts "posts created successfully"
