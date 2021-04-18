class AddRentalPeriodToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :rental_period, :integer, default: 0, null: false
    add_column :orders, :insurance_fee, :integer, default: 0, null: false
  end
end
