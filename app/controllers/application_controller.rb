class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: 
    [address_attributes: [:city,:zipcode,:prefecture,:address1,:address2,]])
  end
end
