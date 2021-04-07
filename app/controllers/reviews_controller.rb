class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.build(review_params)
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.js { render :index }
      else
        format.html { redirect_to product_path(@product), notice: '投稿できませんでした...' }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :comment)
  end
end
