unless User.exists?(email: "admin@vestige.com")
  User.create!(email: "admin@vestige.com", password: "password", admin: true)
end

unless User.exists?(email: "member@vestige.com")
  User.create!(email: "member@vestige.com", password: "password")
end
