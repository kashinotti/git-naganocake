class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image_id, null: false
      t.text :introduction, null: false
      t.integer :non_taxed_price, null: false

      t.timestamps
      
    end
  end
end
