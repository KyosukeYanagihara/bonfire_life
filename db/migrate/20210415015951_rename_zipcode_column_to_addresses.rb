class RenameZipcodeColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :zipcode, :postcode
  end
end
