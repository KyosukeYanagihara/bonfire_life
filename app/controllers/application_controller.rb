class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: 
    [address_attributes: [:city, :postcode, :prefecture_name, :address1, :address2, ],
    account_attributes: [:first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :sex, :contact_number,]])
  end

  def current_cart
    if current_user
      current_cart = current_user.cart || current_user.create_cart!
    else
      current_cart = Cart.find_by(id: session[:cart_id]) || Cart.create
      session[:cart_id] ||= current_cart.id
    end
    current_cart
  end
end
