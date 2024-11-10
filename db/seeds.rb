# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
#
# Clear existing clients and users
User.destroy_all
Client.destroy_all

# Create admin client
Client.create!(
  [
    { name: 'Admin' }
  ]
)

puts "Admin-Client seeded!"

# Create admin user
User.create!(
  [
    { email: 'florian.sitte@live.de', password: 'password123', password_confirmation: 'password123', username: 'florian.sitte', firstname: 'Florian', lastname: 'Sitte', role: 'admin', client_id: Client.first.id }
  ]
)

puts "Admin-User seeded!"
