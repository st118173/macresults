# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "mac@mac.com", password: "MAC2K17",
            password_confirmation: "MAC2K17", admin: 'Admin')

User.create(email: "school@mac.com", password: "school@mac",
            password_confirmation: "school@mac")

