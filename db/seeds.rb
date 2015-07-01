# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: "Amandeep Singh", username: "amandeeps", email: "amandeep.bhamra@gmail.com", password: "testing", password_confirmation: "testing")

100.times { Article.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs(10) , author_id: user.id) }