class RemoveAtorageSizeFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :storage_size, :string
  end
end
