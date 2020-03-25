class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:family_name, :first_name , :family_name_kana, :first_name_kana, :postal_code, :address,:telephone_number])
  end
  def after_sign_in_path_for(resource)
  customers_root_path
end

def after_sign_out_path_for(resource)
  customers_root_path
end
end
