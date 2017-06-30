10.times do 
  User.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10,20)
    )
end

renter = User.first
lessor = User.find(2)

Tenant.create(user: renter)


5.times do
  Lessor.create(user: User.all.sample)
end

20.times do
  HomeListing.create(
    title: Faker::LordOfTheRings.location,
    about: Faker::Lorem.paragraph(3, true, 2),
    capacity: Faker::Number.between(1, 8),
    bathrooms: Faker::Number.between(1, 4),
    bedrooms: Faker::Number.between(0, 3),
    beds: Faker::Number.between(1, 5),
    checkin: Faker::Number.between(1, 24),
    checkout: Faker::Number.between(1, 24) ,
    rules: Faker::Lorem.paragraph(2, true, 1),
    security_deposit: Faker::Number.between(1, 10)*100,
    cleaning_fee: Faker::Number.between(30, 100),
    extra_person_fee: Faker::Number.between(30, 100),
    amenities: Faker::Lorem.word,
    min_stay: Faker::Number.between(1, 7),
    lessor: Lessor.all.sample
  )
end

home_listings = HomeListing.all

home_listings.each do |listing|
  Address.create(
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    address: Faker::Address.street_address,
    home_listing: listing
    )
end