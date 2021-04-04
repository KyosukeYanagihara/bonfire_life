class FavoritesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @favorite = Favorite.create(user_id: current_user.id, product_id: @product.id)
    redirect_to product_path(@product.id)
  end
  def destroy
    @product = Product.find(params[:product_id])
    @favorite = Favorite.find_by(user_id: current_user.id, product_id: @product.id)
    @favorite.destroy
    redirect_to product_path(@product.id)
  end
end
