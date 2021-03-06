# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  layout 'customers'
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
    def after_sign_in_path_for(resource)
      customers_root_path
    end

  # DELETE /resource/sign_out
    def after_sign_out_path_for(resource)
      new_customer_session_path
    end

  protected

  def reject_user
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:error] = "退会済みユーザーです。"
        redirect_to new_customer_session_path
      end
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

