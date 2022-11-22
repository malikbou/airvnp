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
Booking.destroy_all
Venue.destroy_all

puts "Creating venues..."

# t.string "name"
# t.text "address"
# t.integer "capacity"
# t.boolean "booked"
# t.bigint "user_id", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["user_id"], name: "index_venues_on_user_id"

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
puts "Finished!"
