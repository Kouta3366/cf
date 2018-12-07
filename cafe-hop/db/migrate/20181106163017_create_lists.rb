class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.text :name
      t.binary :image_name
      t.integer :area_id
      t.integer :likes

      t.timestamps
    end
  end
end
