class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :explantory_text
      t.boolean :completed

      t.timestamps
    end
  end
end
