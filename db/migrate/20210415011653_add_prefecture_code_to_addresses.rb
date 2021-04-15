class AddPrefectureCodeToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :prefecture_code, :integer, null: false
  end
end
