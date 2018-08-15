# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# Car.all.destroy

CSV.foreach(Rails.root.join('test.csv'), headers: true) do |row|
  car = Car.new(mileage: row[0], cylinders: row[1], liters: row[2], drive: row[3], make: row[4], model: row[5], trany: row[6], year: row[7])
  car.save
end

puts "Created a database of #{Car.count} cars."
