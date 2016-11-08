# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)i
User.create!(name:  "Example User",
             email: "admin@iitk.ac.in",
             roll: "12345",
             phone: "1234567890",
             address: "hell",
             dob: "1796",
             password:              "admin123",
             password_confirmation: "admin123",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "user#{n+1}@iitk.ac.in"
  roll = "#{n+1}"
  phone = "1234567890"
  address = "hell"
  dob = "1 July 1996"
  password = "password"
  User.create!(name:  name,
               email: email,
               roll: roll,
               phone: phone,
               address: address,
               dob: dob,
               password:              password,
               password_confirmation: password)
end
