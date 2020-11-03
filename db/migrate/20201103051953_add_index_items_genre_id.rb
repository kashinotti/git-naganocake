class AddIndexItemsGenreId < ActiveRecord::Migration[5.2]
  def change
    add_index :items, :genre_id
  end
end
