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

