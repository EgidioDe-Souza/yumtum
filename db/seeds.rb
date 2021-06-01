# generate users
12.times do
  email = Faker::Internet.email
  password = 'changeme'
  # name = Faker::Name.name
  puts "Creating user account for #{email}"
  User.create!(email: email, password: password)
  # , name: name
  puts "User ##{User.id} created"
end

# generate meals
50.times do

end

# generate purchases
30.times do

end
