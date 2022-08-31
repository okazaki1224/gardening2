class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many:favorites, dependent: :destroy

  #ジャンルを複数設定したい場合は中間テーブルを作る
  has_one_attached :image
  has_many_attached :post_images

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
