# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "nokogiri"

url = "https://unsplash.com/images/things/house"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)
image_links = []
html_doc.search(".YVj9w.ht4YT").each do |img|
  image_links << img.attribute("src").value
end

puts "destroy all data"
Flat.destroy_all

puts "database cleared"
puts "now seeding"

image_links.each do |img|
  Flat.create(
    name: Faker::FunnyName.name,
    address:  Faker::Address.street_name,
    description: Faker::Restaurant.description,
    price_per_night:  rand(20..50),
    number_of_guests: rand(1..4),
    picture_url: img
  )
end

puts "seeding done"
