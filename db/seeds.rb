
user = User.find_or_initialize_by(email: "admin@admin.com")
user.first_name = "admin"
user.last_name = "admin"
user.password = "password"
user.password_confirmation = "password"
user.admin = true
user.save
