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

60.times do |n|
Instructor.create!(name: "Sir Nayan",
                   dept: "CSE",
                   password: "password",
                   email: "ins#{n+1}@iitk.ac.in")
end

60.times do |n|
Course.create!(dept:  "CSE",
              code: "CS34#{n+5}",
              title: "Algo-#{n+2}",
              email: "ins#{n+1}@iitk.ac.in",
              instructor: "Sir Nayan",
              credit: "9",
              timing: "12:00-1:00")
end

50.times do |n|
Request.create!(user_id: "#{n+1}",
                course_id: "#{n+1}",
                status: "waiting")
end

50.times do |n|
Request.create!(user_id: "#{n+1}",
                course_id: "#{n+2}",
                status: "accepted")
end
