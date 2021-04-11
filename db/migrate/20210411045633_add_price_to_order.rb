class AddPriceToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :price, :integer, null: false, default: 0
  end
end
