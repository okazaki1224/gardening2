class RemoveIsPublishedFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :is_published, :boolean
  end
end
