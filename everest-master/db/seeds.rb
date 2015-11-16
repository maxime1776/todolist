# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

remi = User.new(
email: "remi@mail.com",
password: "remremrem",
  )
remi.save

ousmane = User.new(
email: "ousmane@mail.com",
password: "ousousous"
  )
ousmane.save

willy = User.new(
email: "willy@mail.com",
password: "wilwilwil"
  )
willy.save

jesus = User.new(
email: "jesus@mail.com",
password: "jesjesjes"
  )
jesus.save

10.times do
  gear = Gear.new(
    title: Faker::Book.publisher,
    sport: Gear::SPORTS.sample(),
    brand: Faker::Company.name,
    description: Faker::Lorem.paragraph(10),
    price: rand(10..200),
    user_id: [1,2,3,4].sample(),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    zipcode: rand(10..99).to_s + "500"
  )
  gear.save

  [0,1,2,3].sample.times do
    start_date = Faker::Time.between(DateTime.now + 2, DateTime.now + 100)
    end_date = Faker::Time.between(DateTime.now + 101, DateTime.now + 116)
    booking = Booking.new(
    user_id: [1,2,3,4].shift(gear.user_id).sample(),
    start_date: start_date,
    end_date: end_date,
    gear_id: Gear.last.id,
    confirmed: [true, false].sample()
    )
    booking.save
  end
end
