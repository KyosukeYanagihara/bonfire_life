class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  def sum_of_price
    product.rental_price * quantity
  end
end
