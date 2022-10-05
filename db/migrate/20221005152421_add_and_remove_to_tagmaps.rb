class AddAndRemoveToTagmaps < ActiveRecord::Migration[6.1]
  def change
    remove_column :tagmaps, :post, :references, null: false, foreign_key: true
    remove_column :tagmaps, :tag, :references, null: false, foreign_key: true
  end
end
