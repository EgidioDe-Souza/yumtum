DatabaseCleaner.clean_with(:truncation)
AREA = %w(BN1 GL18 TD7 SE19 BR4 DA9)
ALPH = ('A'..'Z').to_a

# generate users
count = 0
128.times do
  email = Faker::Internet.email
  password = 'changeme'
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  postcode = "#{AREA[rand(0..2)]} #{ALPH[rand(0..25)]}#{rand(0..9)}#{rand(0..9)}"
  chef = count % 4 == 0
  puts "Creating user account for #{first_name} #{last_name}#{' (chef)' if chef}"
  new_user = User.create!(email: email, password: password, first_name: first_name, last_name: last_name, postcode: postcode, chef: chef)
  puts "User created"
  count += 1
end

# generate meals
2048.times do
  chef = User.where(chef: true).sample
  dish = Faker::Food.dish
  name = "#{chef.first_name}'s #{Faker::Hacker.adjective.capitalize} #{dish}"
  description = "#{dish}, with #{Faker::Dessert.flavor} #{Faker::Dessert.variety}"
  price = "#{rand(1..24)}.99"
  chef = User.where(chef: true).sample
  puts "Creating #{name}, from #{chef.email}"
  Meal.create!(name: name, description: description, price: price, chef: chef)
  puts "Meal created"
end

# generate purchases
512.times do
  quantity = rand(1..5)
  meal = Meal.all.sample
  buyer = User.where.not(id: meal.chef.id).sample
  puts "Creating purchase of #{quantity}x #{meal.name} from user #{buyer.email}"
  Purchase.create!(meal: meal, buyer: buyer, quantity: quantity)
  puts "Purchase created"
end
