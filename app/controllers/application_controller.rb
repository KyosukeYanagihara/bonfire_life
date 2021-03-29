class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: 
    [address_attributes: [:city, :zipcode, :prefecture, :address1, :address2, ],
    account_attributes: [:first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, :sex, :contact_number,]])
  end
end
