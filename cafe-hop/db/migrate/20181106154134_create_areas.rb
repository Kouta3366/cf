class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.text :prefecture

      t.timestamps
    end
  end
end
