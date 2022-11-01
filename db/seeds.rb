# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

second_user = User.create(name: 'Lilly', email: 'lilly01@gmail.com', password: '@sam12345', photo: 'https://bit.ly/3BUPMZR', bio: 'Teacher from Poland.')
first_user = User.create(name: 'Billy', email: 'billy01@gmail.com', password: '@edd14324', photo: 'https://bit.ly/3BUPMZR', bio: 'Teacher from Holand.')
