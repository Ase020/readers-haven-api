puts "Seeding authors..."

50.times do
  name = Faker::Name.name
  gender = Faker::Gender.binary_type
  email = Faker::Internet.email
  nationality = Faker::Nation.nationality
  bio = Faker::Lorem.paragraph(sentence_count: 2)

  Author.create!(
    name: name,
    gender: gender,
    email: email,
    nationality: nationality,
    bio: bio
  )
end

puts "Seeding publishers..."

10.times do
  name = Faker::Company.name
  address = Faker::Address.full_address
  email = Faker::Internet.email
  telephone = Faker::PhoneNumber.phone_number

  Publisher.create!(
    name: name,
    address: address,
    email: email,
    telephone: telephone
  )
end

puts "Seeding users..."

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = Faker::Internet.password
  image_url = Faker::Avatar.image(slug: first_name, size: "300x300", format: "png")

  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password_digest: BCrypt::Password.create(password),
    image_url: image_url
  )
end

puts "Seeding books..."

50.times do
  title = Faker::Book.title
  genre = Faker::Book.genre
  description = Faker::Lorem.paragraph(sentence_count: 3)
  publish_date = Faker::Number.between(from: 1900, to: 2023)
  price = Faker::Number.between(from: 10, to: 100)
  author_id = Author.pluck(:id).sample
  user_id = User.pluck(:id).sample
  publisher_id = Publisher.pluck(:id).sample
  poster_url = "https://images.pexels.com/photos/16364335/pexels-photo-16364335/free-photo-of-city-road-landscape-people.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"

  Book.create!(
    title: title,
    genre: genre,
    description: description,
    publish_date: publish_date,
    price: price,
    author_id: author_id,
    user_id: user_id,
    publisher_id: publisher_id,
    poster_url: poster_url
  )
end

puts "Seeding reviews..."

150.times do
  description = Faker::Lorem.paragraph(sentence_count: 2)
  star_rating = Faker::Number.between(from: 1, to: 10)
  book_id = Book.pluck(:id).sample
  user_id = User.pluck(:id).sample

  Review.create!(
    description: description,
    star_rating: star_rating,
    book_id: book_id,
    user_id: user_id
  )
end

puts "Seeding author_publishers..."

author_ids = Author.pluck(:id)
publisher_ids = Publisher.pluck(:id)

author_ids.shuffle!
publisher_ids.shuffle!

num_associations = [author_ids.length, publisher_ids.length].min

num_associations.times do |i|
  author_id = author_ids[i]
  publisher_id = publisher_ids[i]

  AuthorPublisher.create!(
    author_id: author_id,
    publisher_id: publisher_id
  )
end

puts "Done seeding"
