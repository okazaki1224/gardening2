class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  #ジャンルを複数設定したい場合は中間テーブルを作る
  #has_many:favorites
  #has_many:comments
  has_one_attached :image
  has_many_attached :post_images


end
