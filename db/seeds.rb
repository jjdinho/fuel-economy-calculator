# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Car.delete_all if Rails.env.development?

start = Time.now
puts 'Generating seed data...'
puts ""
puts 'This could take a few minutes.'

CSV.foreach(Rails.root.join('cars.csv'), headers: true) do |row|
  car = Car.new(mileage: row[0], cylinders: row[1], liters: row[2], drive: row[3], make: row[4], model: row[5], trany: row[6], year: row[7])
  car.save
end

finish = Time.now
time = finish - start
minutes = (time / 60).floor
seconds = (time % 60).round(2)
puts ''
puts 'Finished.'
puts "Created a database of #{Car.count} cars in #{minutes} #{minutes == 1 ? 'minute' : 'minutes'} and #{seconds}."
