class ChangeDatatypeSizeOfProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :size, :string, null: false
  end
end
