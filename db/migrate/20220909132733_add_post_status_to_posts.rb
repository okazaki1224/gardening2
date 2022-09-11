class AddPostStatusToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_status, :integer, null: false, default:0
  end
end
