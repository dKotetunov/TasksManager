Role.find_or_create_by(name: "admin")
Role.find_or_create_by(name: "moderator")
Role.find_or_create_by(name: "user")

#binding.pry
unless User.find_by_email('super@gmail.com')
  admin = User.create(email: "super@gmail.com", password: "12345678", role: Role.admin)
  admin.skip_confirmation!
  admin.save
end