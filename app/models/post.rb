class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many_attached :post_images
  
  
end
