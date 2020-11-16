class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :count, null: false
      t.integer :tax_in_purchased_price, null: false
      t.integer :making_status, null: false, default: 0

      t.timestamps
    end
  end
end
