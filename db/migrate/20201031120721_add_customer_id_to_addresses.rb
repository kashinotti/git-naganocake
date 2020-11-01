class AddCustomerIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :customer_id, foreign_key: true
    add_reference :items, :genre_id, foreign_key: true
    add_reference :cart_items, :item_id, foreign_key: true
    add_reference :cart_items, :customer_id, foreign_key: true
    add_reference :orders, :customer_id, foreign_key: true
    add_reference :order_items, :order_id, foreign_key: true
    add_reference :order_items, :item_id, foreign_key: true
  end
end
