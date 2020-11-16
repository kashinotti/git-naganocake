class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.string :adress, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
