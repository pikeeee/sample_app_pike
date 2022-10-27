# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Pike Test",
    email: "pike@example.com",
    password: "1",
    password_confirmation: "1",
    admin: true)
    99.times do |n|
        name = Faker::Name.name
        email = "example-#{n+1}@example.com"
        password = "1"
        User.create!(name: name,email: email,
            password: password,
            password_confirmation: password,)
            end
            
    
users = User.order(:created_at).take(6)
50.times do
content = Faker::Lorem.sentence(word_count: 5)
users.each { |user| user.microposts.create!(content: content) }
end
