# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require_relative 'addresses/addresses.rb'
include LondonAddresses

puts "Cleaning database..."

Review.destroy_all
puts "Destroyed reviews"

Booking.destroy_all
puts "Destroyed bookings"

Venue.destroy_all
puts "Destroyed venues"

User.destroy_all
puts "Destroyed users"

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

venue1 = { name: "The Old Queens Head", address: "44 Essex Rd, London N1 8LN", capacity: rand(10..200),
           image_url: "https://lh3.googleusercontent.com/p/AF1QipPy7tIC7KNWmOX5xGhK45RuZ-CvxfDbGCdMXBJr=s1360-w1360-h1020", booked: false,
           description: "A beautiful pub in Islington known for serving award winning burgers & Sunday roasts and hosting club nights & live music.", category: "British Pub", pricing: rand(0..1000), user_id: User.first.id}
venue2 = { name: "The Albion", address: "10 Thornhill Rd, London N1 1HW", capacity: rand(10..200),
           image_url: "https://images.otstatic.com/prod1/48262363/2/huge.jpg", booked: false,
           description: "The Albion is the pride of Islington Pubs offering traditional food and drink in London. Visit us in Islington , we are open everyday.", category: "Al Bion", pricing: rand(0..1000), user_id: User.first.id}
venue3 = { name: "Sessions Arts Club", address: "24 Clerkenwell Grn, London EC1R 0NA", capacity: rand(10..200),
           image_url: "https://www.hot-dinners.com/images/stories/blog/2021/sessions/room1.jpg", booked: false,
           description: "Sessions Arts Club is an urban sanctuary that sits in the old judges' dining room at Sessions House, a grand Grade II listed building in Clerkenwell.", category: "Gallery", pricing: rand(0..1000), user_id: User.first.id}
venue4 = { name: "Hackney Town Hall", address: "Mare St, London E8 1EA", capacity: rand(10..200),
           image_url: "https://images.squarespace-cdn.com/content/v1/50992cbee4b0c49016e6d85c/1575293454716-DUG8NORFTU3RDG0FMSRN/Emma_Dean_180.jpg", booked: false,
           description: "A stones throw away from London Fields and Hackney Central Stations this award winning venue boasts five separate wedding, event and meeting spaces all offering a mixture of period features, natural day light and striking architecture.", category: "Town Hall", pricing: rand(0..1000), user_id: User.first.id}
venue5 = { name: "National Gallery", address: "Trafalgar Square, London WC2N 5DN", capacity: rand(10..200),
           image_url: "https://images.unsplash.com/photo-1654271166015-d87ab7097752?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1030&q=80", booked: false,
           description: "The National Gallery is an art museum in Trafalgar Square in the City of Westminster, in Central London, England. Founded in 1824, it houses a collection of over 2,300 paintings dating from the mid-13th century to 1900.",
           category: "Gallery", pricing: rand(0..1000), user_id: User.first.id}
venue6 = { name: "Aures London", address: "18 Leake St, London SE1 7NN", capacity: rand(10..200),
           image_url: "https://cdn.venuescanner.com/photos/Lw4Nv/ff168fba81c870b1086a9a795430af83.jpg", booked: false,
           description: "Aures London is Europe first fully immersive digital arts and exhibition space with dynamic programming to create unique stand-out events and experiences.",
           category: "Digital Gallery", pricing: rand(0..1000), user_id: User.first.id}

[venue1, venue2, venue3, venue4, venue5, venue6].each do |attributes|
  venue = Venue.create!(attributes)
  puts "Created #{venue.name} with photo url: #{venue.image_url}"
end

photo_id = 0
addresses = LONDON.dup

30.times do
  attributes = { name: Faker::Restaurant.name, address: addresses.sample, capacity: rand(10..200),
                 image_url: "https://source.unsplash.com/random/?Restaurants&#{photo_id}", booked: false,
                 description: Faker::Restaurant.description, category: Faker::Restaurant.type, pricing: Faker::Commerce.price(range: 0..1000.00), user_id: User.first.id}
  venue = Venue.create!(attributes)
  puts "Created #{venue.name} with photo url: #{venue.image_url}"
  photo_id += 1
  addresses.delete(venue.address)
end

puts "Finished venues!"

# REMEMBER TO MAKE VENUES DYNAMIC WITH RANDOM DATA
5.times do
  attributes = { user_id: User.first.id, venue_id: Venue.first.id, start_date: Date.yesterday, end_date: Date.tomorrow }
  attributes2 = { user_id: User.first.id, venue_id: Venue.second.id, start_date: Date.yesterday, end_date: Date.tomorrow }
  booking = Booking.create!(attributes)
  booking2 = Booking.create!(attributes2)
  puts "Created booking for #{booking.user.email} at #{booking.venue.name}"
  puts "Created booking for #{booking2.user.email} at #{booking2.venue.name}"
end

puts "Finished bookings!"
