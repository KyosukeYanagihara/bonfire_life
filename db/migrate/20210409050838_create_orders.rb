class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status, null: false, default: 0
      t.datetime :rental_start, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
