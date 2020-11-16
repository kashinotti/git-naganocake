class AddCustomerIdToItem < ActiveRecord::Migration[5.2]
  def change

    add_column :addresses, :customer_id, :integer, null: false, default: 1
    change_column_default :addresses, :customer_id, nil

    add_column :items, :genre_id, :integer, null: false, default: 1
    change_column_default :items, :genre_id, nil

    add_column :cart_items, :item_id, :integer, null: false, default: 1
    change_column_default :cart_items, :item_id, nil

    add_column :cart_items, :customer_id, :integer, null: false, default: 1
    change_column_default :cart_items, :customer_id, nil

    add_column :orders, :customer_id, :integer, null: false, default: 1
    change_column_default :orders, :customer_id, nil

    add_column :order_items, :order_id, :integer, null: false, default: 1
    change_column_default :order_items, :order_id, nil

    add_column :order_items, :item_id, :integer, null: false, default: 1
    change_column_default :order_items, :item_id, nil



  end
end
