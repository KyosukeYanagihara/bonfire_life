class ReviewsController < ApplicationController
  before_action :set_product
  def create
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

  def edit
    @review = @product.reviews.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'レビューの編集中'
      format.js { render :edit }
    end
  end

  def update
    @review = @product.reviews.find(params[:id])
      respond_to do |format|
        if @review.update(review_params)
          flash.now[:notice] = 'レビューが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'レビューの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    respond_to do |format|
      flash.now[:notice] = '削除されました'
      format.js { render :index }
    end
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :comment)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
