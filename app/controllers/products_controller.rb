class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy  ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result
  end

  def show
    @reviews = @product.reviews
    @review = @product.reviews.build
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to products_path, notice: "作成しました"
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id), notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "削除しました。"
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :rental_price, :selling_price, :size,
                                     :weight, :brand, {images: []})
  end
end
