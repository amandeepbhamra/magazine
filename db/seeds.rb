#--create user-#
user = User.create(name: "Amandeep Singh", username: "amandeeps", email: "amandeep.bhamra@gmail.com", password: "testing", password_confirmation: "testing")
#--create articles--#
100.times { Article.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraphs(10) , author_id: user.id) }