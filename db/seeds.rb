# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# create users for db with faker gem
20.times do
    email = Faker::Internet.email(domain: 'gmail.com')
    user = User.create(email: email, password: "123456", password_confirmation: "123456")
end


#create post with faker gem for random user

80.times do 
    user = User.find(rand(1..20))
    title = Faker::Lorem.sentence(word_count: 20)
    post = Post.create(title: title, user_id: user[:id])
end

#create comment on post with faker
for x in 1..80
    text = Faker::Lorem.sentence(word_count: 10)
    user = User.find(rand(1..20))
    post = Post.find(rand(1..20))
    post.comments.create(text: text, post_id: post.id, user_id: user.id)  
end


# 20.times do 
#     user = User.find(rand(1..20))
#     post = Post.find(rand(1..20))
#     like = Like.create(user: user, likeable: post)

# end

# send and accept request of users
20.times do
    user1 = User.find(rand(1..20))
    user2 = User.find(rand(1..20))
    user1.send_follow_request_to(user2)
    user2.accept_follow_request_of(user1)
end