puts "Generating my user"

u = User.find_or_create_by(username: "mleo")
u.update_attributes({
    first_name: "Mike",
    last_name: "Leo",
    city: "Columbus",
    state: "Ohio",
    bio:   "lorem",
    fake:  false,
    email: "mleo2857@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    })

u.save!

puts "Deleting fake users"
User.where(fake: true).destroy_all

puts "Generating fake users\n"
10.times do
    putc "."
    User.create!({
        username: Faker::Internet.username,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        bio: Faker::Lorem.paragraph,
        fake: true,
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456",
    })
    
end

puts "done"