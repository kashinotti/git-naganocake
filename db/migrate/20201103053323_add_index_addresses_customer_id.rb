class AddIndexAddressesCustomerId < ActiveRecord::Migration[5.2]
  def change
    add_index :addresses, :customer_id
    add_index :cart_items, :customer_id
    add_index :cart_items, :item_id
    add_index :orders, :customer_id
    add_index :order_items, :order_id
    add_index :order_items, :item_id
  end
end
