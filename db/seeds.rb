DatabaseCleaner.clean_with(:truncation)

# generate users
12.times do
  email = Faker::Internet.email
  password = 'changeme'
  puts "Creating user account for #{email}"
  User.create!(email: email, password: password)
  puts "User created"
end

# generate meals
50.times do
  name = Faker::Food.dish
  description = Faker::Food.description
  price = "#{rand(1..24)}.99"
  chef = User.find(rand(1..12))
  puts "Creating #{name}, from #{chef.email}"
  Meal.create!(name: name, description: description, price: price, chef: chef)
  puts "Meal created"
end

# generate purchases
30.times do
  quantity = rand(1..5)
  meal = Meal.find(rand(1..50))
  buyer = User.find(rand(1..12))
  puts "Creating purchase of #{quantity}x #{meal.name} from user #{buyer.email}"
  Purchase.create!(meal: meal, buyer: buyer, quantity: quantity)
  puts "Purchase created"
end
