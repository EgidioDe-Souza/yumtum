DatabaseCleaner.clean_with(:truncation)
AREA = %w(BN1 GL18 TD7)
ALPH = ('A'..'Z').to_a

# generate users
12.times do
  email = Faker::Internet.email
  password = 'changeme'
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  postcode = "#{AREA[rand(0..2)]} #{ALPH[rand(0..25)]}#{rand(0..9)}#{rand(0..9)}"
  puts "Creating user account for #{first_name} #{last_name}"
  User.create!(email: email, password: password, first_name: first_name, last_name: last_name, postcode: postcode)
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
