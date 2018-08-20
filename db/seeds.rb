u = User.find_or_create_by(username: "objo")
u.update_attributes({
    first_name: "Mike",
    last_name: "Leo",
    city: "Columbus",
    state: "Ohio",
    bio:   "lorem",
    })
    
u.save!