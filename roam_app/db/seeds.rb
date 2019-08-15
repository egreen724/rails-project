# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
  [
    {name: "Audre",
    email: "audre_green@yahoo.com",
    password_digest: "test",
    bio: "Outdoorswoman", 
    age: "28"
  }
  ]
)

activities = Activity.create(
  [
    {name: "Blood Mountain",
    distance: 4.3 ,
    street_address: "Byron Reece Memorial Trail",
    city: "Blairsville",
    state: "GA",
    zip_code: 30512,
    category: "hike",
    difficulty_rating: 3,
    parking: true,
    creator_id: 1
    }
  ]
)
