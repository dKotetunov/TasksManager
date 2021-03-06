Role.find_or_create_by(name: "admin")
Role.find_or_create_by(name: "moderator")
Role.find_or_create_by(name: "user")

unless User.find_by_email('super@gmail.com')
  admin = User.create(email: "super@gmail.com", password: "12345678", role: Role.admin, profile_attributes: { first_name: 'Super', last_name: 'Admin' })
  admin.skip_confirmation!
  admin.save
end
unless User.find_by_email('moderator@gmail.com')
  admin = User.create(email: "moderator@gmail.com", password: "12345678", role: Role.moderator, profile_attributes: { first_name: 'First', last_name: 'Moderator' })
  admin.skip_confirmation!
  admin.save
end
unless User.find_by_email('user@gmail.com')
  admin = User.create(email: "user@gmail.com", password: "12345678", role: Role.user, profile_attributes: { first_name: 'First', last_name: 'User' })
  admin.skip_confirmation!
  admin.save
end