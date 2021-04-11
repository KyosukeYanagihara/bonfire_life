class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def new
    if params[:back]
      @order = Order.new(order_params)
    else
      @order = Order.new
    end
  end

  def confirm
    @order = current_user.orders.build(order_params)
    render :new if @order.invalid?
    @cart_items = current_cart.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create  
    @order = current_user.orders.build(order_params)
    @cart_items = current_cart.cart_items
    @order.price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @cart_items.each do |item|
      @order_item = @order.order_items.build
      @order_item.product_id = item.product_id
      @order_item.quantity = item.quantity
      @order_item.save
    end
    @order.save
    @cart_items.delete_all
    redirect_to complete_orders_path
  end

  private
  
  def order_params
    params.require(:order).permit(:rental_start, :user_id)
  end
end
