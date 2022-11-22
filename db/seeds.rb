# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Cleaning database..."

Review.destroy_all
puts "Destroyed reviews"

Booking.destroy_all
puts "Destroyed bookings"

Venue.destroy_all
puts "Destroyed venues"

puts "Creating users..."
user1 = {email: "admin@admin.com", password: "adminadmin"}
user2 = {email: "daniela@cupcakes.com", password: "danielalovescupcakes"}
user3 = {email: "gabriel@cookies.com", password: "gabriellovescookies"}
user4 = {email: "chirantan@phones.com", password: "chirantanlovesphones"}
user5 = {email: "malik@chocolate.com", password: "malikloveschocolate"}

[user1, user2, user3, user4, user5].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.email}"
end
puts "Finished users!"


puts "Creating venues..."

venue1 = {name: "The Old Qeens Head", address: Faker::Address.street_address, capacity: rand(5..30), booked: false, user_id: 1}
venue2 = {name: "The Albion", address: Faker::Address.street_address, capacity: rand(5..30), booked: false, user_id: 1}
venue3 = {name: "Sessions Arts Club", address: Faker::Address.street_address, capacity: rand(5..30), booked: false, user_id: 1}
venue4 = {name: "Hackney Town Hall", address: Faker::Address.street_address, capacity: rand(5..30), booked: false, user_id: 1}
venue5 = {name: "National Gallery", address: Faker::Address.street_address, capacity: rand(5..30), booked: false, user_id: 1}
venue6 = {name: "Aures London", address: Faker::Address.street_address, capacity: rand(5..30), booked: false, user_id: 1}

[venue1, venue2, venue3, venue4, venue5, venue6].each do |attributes|
  venue = Venue.create!(attributes)
  puts "Created #{venue.name}"
end
puts "Finished venues!"
