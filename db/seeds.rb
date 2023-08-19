# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# Create some sample users
user1 = User.create(email: 'user1@example.com', password: 'password')
user2 = User.create(email: 'user2@example.com', password: 'password')

# Create some sample chirps associated with users
chirp1 = user1.api_v1_chirps.create(body: 'Sample chirp 1')
chirp2 = user2.api_v1_chirps.create(body: 'Sample chirp 2')
