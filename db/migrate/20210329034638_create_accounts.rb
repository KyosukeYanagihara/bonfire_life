class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.boolean :admin, default: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.datetime :birthday
      t.integer :sex
      t.integer :contact_number, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
