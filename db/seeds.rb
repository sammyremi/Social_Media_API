# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# for x in 1..10 do
#     email = "admin#{x}@g.com"
#     @user = User.create(email: email, password: "123456", password_confirmation: "123456")
    
#     if @user.persisted?
#       puts "User created: #{email}"
#     else
#       puts "Failed to create user: #{email}"
#       puts @user.errors.full_messages
#     end
# end

for x in 1..20 do
    @user = User.find(x)
    title = "second post by #{@user.email} created"
    id = @user.id
    @post = Post.create(title: title, user_id: id)
    if @post.persisted?
        puts "post created: #{@post.title}"
    else
        puts "Failed to create post: #{@user}"
        puts @post.errors.full_messages
    end
end

  