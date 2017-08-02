
################# USERS ##################
user_count = 15
user_count.times do
  username = "#{Faker::Name.first_name}.#{Faker::Name.last_name}".downcase
  email = Faker::Internet.safe_email(username)

  User.create(
    username: username,
    email: email,
    password: "password"
    )

end


################ RESTAURANTS ###################
restaurant_count = 10
restaurant_count.times do
  name = Faker::Name.first_name


  Restaurant.create(
    owner_id: (rand(15) + 1),
    name: "#{Faker::Name.first_name}'s",
    cuisine: Faker::Dessert.variety,
    address: Faker::Address.street_address,
    city: "#{Faker::Name.last_name}#{Faker::Address.city_suffix}",
    state: Faker::Address.state,
    zip: Faker::Address.zip
    )
end

################ REVIEWS #################
review_count = 10
review_count.times do
  Review.create(
    reviewer_id: (rand(user_count) + 1),
    restaurant_id: (rand(restaurant_count) + 1),
    title: Faker::Hipster.sentence(rand(2..5)),
    body: Faker::Hipster.sentence(rand(6)),
    rating: (rand(5) + 1)
    )
end


