class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy 
end
