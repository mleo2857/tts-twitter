
IMAGES_DIR = File.expand_path(File.dirname(__FILE__) + "/../app/assets/images")


def create_messages(user)
    puts "Creating messages"
   
    20.times{
         putc '.'
        user.messages.create! ({
            body: Faker::ChuckNorris.fact,
            created_at: Faker::Date.between(2.weeks.ago, Time.now),
        })
    }
    user.save
    puts "done"
end
Message.destroy_all

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
create_messages(u)


puts "Deleting fake users"
User.where(fake: true).destroy_all


puts "Generating fake users\n"
10.times do |time|
    u = User.new({
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
    filename = "user_profile_#{time + 1}.jpg"
    u.avatar.attach(io: File.open(IMAGES_DIR + "/" + filename), filename: filename)
    u.save!
    sleep 3
    create_messages(u)
    
    
end

puts "done"