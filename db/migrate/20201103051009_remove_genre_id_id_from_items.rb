class RemoveGenreIdIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :genre_id_id, :integer
    remove_column :cart_items, :customer_id_id, :integer
    remove_column :cart_items, :item_id_id, :integer
    remove_column :addresses, :customer_id_id, :integer
    remove_column :order_items, :order_id_id, :integer
    remove_column :order_items, :item_id_id, :integer
    remove_column :orders, :customer_id_id, :integer
  end
end
