# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Vehicle.destroy_all
Profile.destroy_all
Type.destroy_all
User.destroy_all

Faker::Config.locale = 'fr'
type_examples = ["Voiture", "Tricycle", "Side-car", "Scooter", "Trottinette", "Porteur pour bébé", "Char à Voiles", "Autre"]
status = ["Pending", "Accepted", "Declined"]
rue = ["boulevard de la liberté", "rue nationale", "rue royale", "boulevard Montebello", "rue colbert", "boulevard Vauban", "rue Solférino"]

type_examples.each do |type|
  Type.create!(name: type)
end

i = 1
while i < 10
  user = User.create!(email: "user#{i}@gmail.com", password: "123456")
  profile = Profile.create!(user: user,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address_street: "#{rand(1..200)} #{rue.sample}",
    address_city: "Lille",
    address_zipcode: "59000"
    )
  profile.remote_photo_url = "https://loremflickr.com/320/240/avatar/?rand=#{i}"
  p profile
  profile.save!
  j = 1
  vehicle = Vehicle.create!(name: Faker::Vehicle.make_and_model,
    type: Type.all.sample,
    price: rand(5000..50000),
    description: Faker::Lorem.paragraphs,
    profile: profile,
    seats: rand(1...5),
    address_street: profile.address_street,
    address_city: profile.address_city,
    address_zipcode: profile.address_zipcode
    )
  Booking.create!(start_date: "03/12/2018",
    end_date: "10/12/2018",
    profile: Profile.all.sample,
    vehicle: vehicle,
    price: vehicle.price * 7,
    status: status.sample
    )
  i += 1
end

# Adding pictures to vehicles
Vehicle.all.each_with_index do |vehicle, i|
  vehicle.remote_photo_url = "https://loremflickr.com/1000/800/vehicle/?rand=#{i}"
  vehicle.save!
  p vehicle
end
