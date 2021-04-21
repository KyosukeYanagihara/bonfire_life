class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.json :images, null: false
      t.text :description, null: false
      t.integer :rental_price, null: false
      t.integer :selling_price, null: false
      t.integer :size, null: false
      t.integer :storage_size, null: false
      t.integer :weight, null: false
      t.integer :stock, default: 1
      t.string :brand

      t.timestamps
    end
  end
end
