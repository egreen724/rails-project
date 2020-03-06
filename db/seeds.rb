# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#[#<Activity id: 1, name: "Blood Mountain", distance: 4.3, street_address: "Byron Reece Memorial Trail", city: "Blairsville", state: "GA", zip_code: 30512, category: "Hike", difficulty_rating: 3, parking: true, creator_id: 1>, #<Activity id: 2, name: "Stone Mountain", distance: 1.0, street_address: "123 Stone Mountain Park", city: "Stone Mountain", state: "GA", zip_code: 30309, category: "Hike", difficulty_rating: 1, parking: true, created_at: "2019-08-15 21:39:30", updated_at: "2019-08-15 21:39:30", creator_id: 1>, #<Activity id: 3, name: "Silver Comet Trail", distance: 40.0, street_address: "", city: "", state: "GA", zip_code: 30306, category: "Bike Ride", difficulty_rating: 2, parking: true, created_at: "2019-08-17 20:13:58", updated_at: "2019-08-17 20:13:58", creator_id: 3>]

users = User.create(
  [
    {name: "Audre",
    email: "audre_green@yahoo.com",
    password: "test",
    bio: "Outdoorswoman",
    age: 28
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

def hikingProject
  resp = Faraday.get'https://www.trailrunproject.com/data/get-trails?lat=33.7490&lon=-84.3880&maxDistance=100&key=200698535-4098c733d748c83170ea0acf1eb80619' do
  end
  resp_body = JSON.parse(resp.body)

  trail_hash = resp_body["trails"]

  trail_hash.each do |trail, index|

    if trail["difficulty"].include? "blue"
      rating = 3
    elsif trail["difficulty"].include? "black"
      rating = 5
    else
      rating = 1
    end

    city = trail["location"].split(',')[0]
    state = trail["location"].split(',')[1]

    new_trail = Activity.new(
      name: trail["name"],
      distance: trail["length"],
      state: "GA",
      city: city,
      zip_code: 30306,
      category: "hike",
      difficulty_rating: rating,
      creator_id: 1
    )
  

    if new_trail.valid?
      new_trail.save
    end

  end
end
